extends Node2D

class_name GameMaster

@export var player: Player

# Player Statistics
var playerScore = 0
var EnemiesKilled = 0

# Game Status
var isPaused = false

var isPlaying = true
var rawTime = 0
var _time = 0

var seconds = 0
var minutes = 0

func _ready() -> void:
	while isPlaying:
		rawTime += 1
		seconds += 1
		if seconds == 60:
			seconds = 0
			minutes += 1
		await get_tree().create_timer(1).timeout


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player != null:
		playerScore = player.score
		EnemiesKilled = player.enemiesKilled
	
