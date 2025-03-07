extends CharacterBody2D

@export var speed = 100

#func _ready() -> void:
	#print("Loaded")
	#await get_tree().create_timer(10).timeout
	#queue_free()

func _physics_process(delta: float) -> void:
	#just a random addition para lng malihok nako ang object
	move_and_collide(Vector2(0,1).normalized() * delta * speed)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.addCoin()
		queue_free()
