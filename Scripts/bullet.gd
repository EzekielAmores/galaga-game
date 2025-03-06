extends CharacterBody2D

class_name Bullet

var _velocity = Vector2(0, -1)
@export var speed = 1000

var _owner: Player

func _physics_process(delta: float) -> void:
	move_and_collide(_velocity.normalized() * delta * speed)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Enemy:
		#print("Hit")
		body.player = _owner
		body.takeDamage(10)
		queue_free()
