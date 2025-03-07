extends CharacterBody2D

class_name Enemy

var _velocity = Vector2(0, 1)
@export var speed = 0

@export var bulletInstance: PackedScene
@export var BulletTransform: Node2D

@export var bulletSpeed = 200
@export var damage = 0.5

var hp = 100

var player: Player

func _ready() -> void:
	spawnBullets()

func _process(delta: float) -> void:
	if hp <= 0:
		if player != null:
			player.score += 20
		queue_free()

func _physics_process(delta: float) -> void:
	move_and_collide(_velocity.normalized() * delta * speed)
	
func takeDamage(damage: int):
	hp -= damage

func spawnBullets():
	while true: 
		#print("Hello po, shoot")
		var instance = bulletInstance.instantiate()
		instance.position = BulletTransform.global_position
		
		if instance is enemy_Bullet:
			instance.bulletSpeed = bulletSpeed
			instance.damage = damage
		
		owner.add_child(instance)
		await get_tree().create_timer(1).timeout
