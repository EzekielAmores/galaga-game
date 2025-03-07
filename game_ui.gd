extends Control

var isPaused = false
@export var PauseUI: Control

@export var ResumeButton: Button
@export var LeaveButton: Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ResumeButton.pressed.connect(resumeGame)
	LeaveButton.pressed.connect(leaveGame)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		print("pause ba unsa mani uyyyyy")
		pauseMenu()

# Called when the node enters the scene tree for the first time.
func pauseMenu():
	if isPaused:
		PauseUI.hide()
		Engine.time_scale = 1
	else:
		PauseUI.show()
		Engine.time_scale = 0
	isPaused = !isPaused

func resumeGame():
	PauseUI.hide()
	Engine.time_scale = 1
	isPaused = false
	
func leaveGame():
	get_tree().change_scene_to_file("res://main_menu.tscn")
