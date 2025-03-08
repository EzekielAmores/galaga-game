extends Node2D

@export var speed = 100

@export var first_Scrollable: Node2D
@export var scrollableCopy: PackedScene

var currentScrollable: Node2D
var currentConnector: Node2D
var oldConnector: Node2D

var hasChanged = false

func _ready() -> void:
	currentScrollable = first_Scrollable
	currentConnector = first_Scrollable.get_child(2)
	oldConnector = currentConnector
	print("Current connector " + str(oldConnector))


func _process(delta: float) -> void:

	if currentConnector.global_position.y > -1000 and hasChanged == false:
		var instance = scrollableCopy.instantiate()
		add_child(instance)
		instance.global_position = currentConnector.global_position
		move_child(instance, 0)
		
		currentScrollable = instance
		oldConnector = currentConnector
		currentConnector = currentScrollable.get_child(2)
				
		#hasChanged = true
	if oldConnector.global_position.y >= 50:
		if get_child(1) != null:
			oldConnector = currentConnector
			get_child(1).queue_free()

func _physics_process(delta: float) -> void:
	position.y += 1 * delta * speed
	#print(position.y)
