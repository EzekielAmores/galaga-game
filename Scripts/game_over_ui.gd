extends Control

@export var gameMaster: GameMaster

var player: Player

@export var scoreText: Label
@export var restartButton: Button
@export var quitButton: Button

func _ready() -> void:
	restartButton.pressed.connect(restart)
	quitButton.pressed.connect(quit)

func _process(delta: float) -> void:
	scoreText.text = "Score: " + str(gameMaster.playerScore).pad_zeros(9)
	
func restart():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
	get_parent().get_parent().hide()
	
func quit():
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
