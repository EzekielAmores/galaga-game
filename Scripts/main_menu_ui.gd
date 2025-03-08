extends Control

@export var startButton: Button
@export var quitButton: Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startButton.pressed.connect(start)
	quitButton.pressed.connect(quit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start():
	get_tree().change_scene_to_file("res://Scenes/NewScene.tscn")

func quit():
	print("mu leave nako")
	get_tree().quit()
	
