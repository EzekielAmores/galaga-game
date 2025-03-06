extends CharacterBody2D


func _physics_process(delta: float) -> void:
	#just a random addition para lng malihok nako ang object
	move_and_collide(Vector2(0,0).normalized())


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.addCoin()
		queue_free()
