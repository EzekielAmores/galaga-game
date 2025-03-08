extends CharacterBody2D

class_name Enemy

var player: Player

@export var hp = 100

@export_category("Bullet")
@export var bulletInstance: PackedScene
@export var BulletTransform: Node2D

@export var bulletSpeed = 200
@export var bulletDamage = 0.5

#func _ready() -> void:
	#spawnBullets()

func _process(delta: float) -> void:
	if hp <= 0:
		if player != null:
			player.score += 20
			player.enemiesKilled += 1
		queue_free()
	
func takeDamage(damage: int):
	hp -= damage

#func spawnBullets():
	#while true: 
		##print("Hello po, shoot")
		##shoot()
		#await get_tree().create_timer(1).timeout

func shoot():
	var instance = bulletInstance.instantiate()
	instance.position = BulletTransform.global_position
		
	if instance is enemy_Bullet:
		instance.speed = bulletSpeed
		instance.damage = bulletDamage
		
	get_tree().root.add_child(instance)
