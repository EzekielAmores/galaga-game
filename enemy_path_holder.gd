extends CharacterBody2D

@export var enemyPath: PathFollow2D
var start = 0
var end = 1
var value = 0.0
@export var speed = 10
@export var moveSpeed = 10
var increasing = true
var _velocity = Vector2(0, 1)


func _process(delta: float) -> void:
	# 0 to 1 back to 0
	
	if increasing == true:
		value += 0.1 * delta * speed
	else:
		value -= 0.1 * delta * speed
		
	if value >= end:
		enemyPath.progress_ratio = 1
		increasing = false
		return
	if value <= start:
		enemyPath.progress_ratio = 0
		increasing = true
		return
		
		
	enemyPath.progress_ratio = lerp(start, end, value)
	#print("The Value is " + str(value))
	
func _physics_process(delta: float) -> void:
	move_and_collide(_velocity.normalized() * delta * moveSpeed)
		
	
