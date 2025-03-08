extends Control

@export var gameMaster: GameMaster

var isPaused = false

@export var scoreText: Label
@export var resumeButton: Button
@export var quitButton: Button

func _ready() -> void:
	resumeButton.pressed.connect(resumeGame)
	quitButton.pressed.connect(leaveGame)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		print("pause ba unsa mani uyyyyy")
		pauseMenu()
	
	scoreText.text = "Score: " + str(gameMaster.playerScore).pad_zeros(9)

func pauseMenu():
	if isPaused:
		self.hide()
		Engine.time_scale = 1
	else:
		self.show()
		Engine.time_scale = 0
	isPaused = !isPaused
	gameMaster.isPaused = isPaused

func resumeGame():
	self.hide()
	Engine.time_scale = 1
	isPaused = false
	gameMaster.isPaused = isPaused
	
func leaveGame():
	Engine.time_scale = 1
	isPaused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
