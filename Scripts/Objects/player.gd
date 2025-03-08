extends CharacterBody2D

class_name Player

@export var gameMaster: GameMaster

@export var bulletInstance: PackedScene
@export var BulletTransform: Node2D

@export var fireRate = 0.1

# Statistics
var hp = 1
var score = 0
var coin = 0
var enemiesKilled = 0

func _ready() -> void:
	# Preps the player to mouse position
	position = get_global_mouse_position()
	spawnBullets()

func _process(delta: float) -> void:
	if hp >= 5:
		queue_free()
	
	

func spawnBullets():
	while true: 
		
		for x in range(3):
			var instance = bulletInstance.instantiate()
			instance.position = BulletTransform.global_position
			instance.position.x += (x - 1) * 15
			
			if instance is Bullet:
				instance._owner = self
				
			get_parent().add_child(instance)
		
		await get_tree().create_timer(fireRate).timeout


func _physics_process(delta: float) -> void:
	
	if gameMaster.isPaused == false:
		#position = get_global_mouse_position()
		var direction = (get_global_mouse_position() - global_position)
		var distance = direction.length()
		direction = direction.normalized()
		
		#print("hey the distance is " + str(distance))
		if distance < 10:
			position = get_global_mouse_position()
		else:
			# Explanation 
			# Direction = the path from player to the mouse
			# Delta = space the frames evenly
			# Distance = multiplies to the distance from player to mouse
			# 100 = constant
			move_and_collide(direction * delta * distance * 100)
	
func takeDamage(damage: float):
	hp += damage
	
func addCoin():
	coin += 1
