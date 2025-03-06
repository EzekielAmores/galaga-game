extends CharacterBody2D

var _velocity = Vector2(0, 1)
@export var speed = 500


func _physics_process(delta: float) -> void:
	move_and_collide(_velocity.normalized() * delta * speed)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.takeDamage(20)
		queue_free()
