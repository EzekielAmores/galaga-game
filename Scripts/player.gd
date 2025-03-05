extends CharacterBody2D

class_name Player

@export var bulletInstance: PackedScene
@export var BulletTransform: Node2D

func _ready() -> void:
	spawnBullets()
	pass

#func _process(delta: float) -> void:
	#position = get_global_mouse_position()
	
	

func spawnBullets():
	#SpawnBullet
	while true: 
		#print("Hello po, shoot")
		var instance = bulletInstance.instantiate()
		instance.position = BulletTransform.global_position
		get_parent().add_child(instance)
		await get_tree().create_timer(0.1).timeout


func _physics_process(delta: float) -> void:
	position = get_global_mouse_position()
