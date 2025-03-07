extends CharacterBody2D

class_name Player

@export var bulletInstance: PackedScene
@export var BulletTransform: Node2D

@export var fireRate = 0.1

# Statistics
var hp = 1
var score = 0
var coin = 0

func _ready() -> void:
	spawnBullets()

func _process(delta: float) -> void:
	
	if hp >= 5:
		queue_free()
	
	

func spawnBullets():
	while true: 
		var instance = bulletInstance.instantiate()
		instance.position = BulletTransform.global_position
		
		if instance is Bullet:
			instance._owner = self
			
		get_parent().add_child(instance)
		
		await get_tree().create_timer(fireRate).timeout


func _physics_process(delta: float) -> void:
	position = get_global_mouse_position()
	#move_and_collide(get_global_mouse_position().normalized())
	
func takeDamage(damage: float):
	hp += damage
	
func addCoin():
	coin += 1
