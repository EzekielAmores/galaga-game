extends Control

@export var resumeButton: Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func printHello():
	print("Hello")


func _on_restart_button_pressed() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
	get_parent().get_parent().hide()
