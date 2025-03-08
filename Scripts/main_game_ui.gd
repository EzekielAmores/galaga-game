extends Control

# Dari nalang sa nako i butang ang mga logic sa wave ug sa enemy, pero other than that, sa pikas na
# tong health and score

@export var gameMaster: GameMaster

@export var noOfEnemiesKilled: Label

@export var timerText: Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	noOfEnemiesKilled.text = str(gameMaster.EnemiesKilled).pad_zeros(3) + "X"

	
	timerText.text = "Time: " + str(gameMaster.minutes).pad_zeros(2) + ":" + str(gameMaster.seconds).pad_zeros(2)
	
