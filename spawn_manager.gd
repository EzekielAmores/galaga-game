extends Node2D

# Area in which Enemy Spawn
@export var spawnedArea: CollisionShape2D

# Coin Scene
@export var coinInstance: PackedScene

@export var spawnRate = 10

func _ready() -> void:
	var startVector = spawnedArea.get_parent().global_position
	var endVector = spawnedArea.shape.size
	
	while true: 
		var instance = coinInstance.instantiate()
		
		var randVectorX = randi_range(startVector.x, (startVector.x + endVector.x))
		var randVectorY = randi_range(startVector.y, (startVector.y + endVector.y))
		
		instance.position = Vector2(randVectorX, randVectorY)
		owner.add_child(instance)
		await get_tree().create_timer(spawnRate).timeout


func _process(delta: float) -> void:
	pass
	
