extends CharacterBody2D

@export var enemyPath: PathFollow2D

@export_category("Enemy Path Values")
@export var slideSpeed = 10
@export var forwardSpeed = 10

@export var enemyScene: PackedScene
@export var numberOfEnemies = 1
@export var enemySpawnDirection: Vector2

var enemies

var increasing = true
var value = 0.0

func _ready() -> void:
	spawnEnemies()
	print(enemyPath.get_children())

func _process(delta: float) -> void:
	enemies = enemyPath.get_children()
	
	if increasing == true:
		value += 0.1 * delta * slideSpeed
	else:
		value -= 0.1 * delta * slideSpeed
		
	if value >= 1:
		enemyPath.progress_ratio = 1
		increasing = false
		
		for enemy in enemies:
			if enemy is Enemy:
				enemy.shoot()
		return
	if value <= 0:
		enemyPath.progress_ratio = 0
		increasing = true
		
		for enemy in enemies:
			if enemy is Enemy:
				enemy.shoot()
		return
		
	enemyPath.progress_ratio = lerp(0, 1, value)
	
func _physics_process(delta: float) -> void:
	# Move down
	move_and_collide(Vector2(0, 1).normalized() * delta * forwardSpeed)
		

func spawnEnemies():
	for i in range(numberOfEnemies):
		var instance = enemyScene.instantiate()
		enemyPath.add_child(instance)
		instance.position = Vector2((i * 100 * enemySpawnDirection.x), 0)
