extends CharacterBody2D

var _velocity = Vector2(0, -1)
@export var speed = 1000


func _physics_process(delta: float) -> void:
	move_and_collide(_velocity.normalized() * delta * speed)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Enemy:
		#print("Hit")
		queue_free()
		body.takeDamage(10)
