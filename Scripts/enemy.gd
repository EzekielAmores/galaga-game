extends CharacterBody2D

class_name Enemy

var _velocity = Vector2(0, 1)
@export var speed = 0

@export var bulletInstance: PackedScene
@export var BulletTransform: Node2D

var hp = 100

var player: Player

func _ready() -> void:
	spawnBullets()

func _process(delta: float) -> void:
	if hp <= 0:
		player.score += 20
		queue_free()

func _physics_process(delta: float) -> void:
	move_and_collide(_velocity.normalized() * delta * speed)
	
func takeDamage(damage: int):
	hp -= damage

func spawnBullets():
	#SpawnBullet
	while true: 
		#print("Hello po, shoot")
		var instance = bulletInstance.instantiate()
		instance.position = BulletTransform.global_position
		get_parent().add_child(instance)
		await get_tree().create_timer(1).timeout


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Bullet:
		#print("kjsfhkasjfhasjksjkafhsjakfhasjkdf")
		pass
