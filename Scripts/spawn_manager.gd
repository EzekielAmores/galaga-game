extends Node2D

@export var gameMaster: GameMaster

# Area in which Enemy Spawn
@export var spawnedArea: CollisionShape2D

# Coin Scene
@export var coinInstance: PackedScene

@export var spawnRate = 10

@export  var waves: Array[Wave]
@export  var alternateWaves: Array[Wave]

var isSpawned = false

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
	if isSpawned == false:
		if gameMaster.seconds == 30 or gameMaster.seconds == 1 or gameMaster.seconds == 20 or gameMaster.seconds == 40:
			print("SPAWNING WAVES")
			spawnWave(false)
			
			isSpawned = true
			await get_tree().create_timer(1).timeout
			isSpawned = false
		if gameMaster.seconds == 5 or gameMaster.seconds == 15 or gameMaster.seconds == 25:
			print("SPAWNING WAVES")
			spawnWave(true)
			
			isSpawned = true
			await get_tree().create_timer(1).timeout
			isSpawned = false

func spawnWave(alternate: bool):
	if alternate == false:
		var startPoint = spawnedArea.global_position.x - 300
		
		for i in range(7):
			var instance = waves[randi_range(0, waves.size() - 1)].enemyPaths[i].instantiate()
			instance.position = Vector2(startPoint + (i * 100), spawnedArea.global_position.y)
			owner.add_child(instance)
	elif alternate == true:
		var startPoint = spawnedArea.global_position.x - 350
		
		for i in range(6):
			var instance = alternateWaves[randi_range(0, alternateWaves.size() - 1)].enemyPaths[i].instantiate()
			instance.position = Vector2(startPoint + (i * 100), spawnedArea.global_position.y)
			owner.add_child(instance)
		
		
