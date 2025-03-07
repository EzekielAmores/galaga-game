extends Node2D

@export var spawnedArea: CollisionShape2D
var e: RectangleShape2D

@export var coinInstance: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
	while true: 
		var instance = coinInstance.instantiate()
		instance.position = Vector2(randi_range(spawnedArea.get_parent().global_position.x, (spawnedArea.get_parent().global_position.x + spawnedArea.shape.size.x)), randi_range(spawnedArea.get_parent().global_position.y, (spawnedArea.get_parent().global_position.y + spawnedArea.shape.size.y)))
		print("Instance Position is " + str(instance.position))
		print(spawnedArea.get_parent().name)
		print(spawnedArea.get_parent().global_position)
		
		owner.add_child(instance)
		await get_tree().create_timer(1).timeout


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#print(spawnedArea.shape.size)
	#print(spawnedArea.global_position)
	
