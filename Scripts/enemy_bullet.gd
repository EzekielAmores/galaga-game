extends CharacterBody2D

class_name enemy_Bullet

var _velocity = Vector2(0, 1)
@export var speed = 500

var damage: float
var bulletSpeed: int

func _physics_process(delta: float) -> void:
	move_and_collide(_velocity.normalized() * delta * bulletSpeed)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		print("Player Hit")
		body.takeDamage(damage)
		queue_free()
