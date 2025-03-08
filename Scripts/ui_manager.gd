extends Control

@export var resumeButton: Button
@export var gameOverUI: Control

# Base Statistics
@export var player: Player

@export var hpText: Label
@export var coinText: Label
@export var scoreText: Label

var isDead = false

@export var hpImage: TextureRect

@export var oneGpa: CompressedTexture2D
@export var oneFiveGpa: CompressedTexture2D
@export var twoGpa: CompressedTexture2D
@export var twoFiveGpa: CompressedTexture2D
@export var threeGpa: CompressedTexture2D
@export var threeFiveGpa: CompressedTexture2D
@export var fourGpa: CompressedTexture2D
@export var fiveGpa: CompressedTexture2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if player != null: # Check if player exist
		hpText.text = "GPA: " + str(player.hp)
		coinText.text = str(player.coin).pad_zeros(3)
		scoreText.text = str(player.score).pad_zeros(9)
		
		if player.hp > 5:
			hpImage.texture = fiveGpa
		elif player.hp >= 4:
			hpImage.texture = fourGpa
		elif player.hp >= 3.5:
			hpImage.texture = threeFiveGpa
		elif player.hp >= 3:
			hpImage.texture = threeGpa
		elif player.hp >= 2.5:
			hpImage.texture = twoFiveGpa
		elif player.hp >= 2:
			hpImage.texture = twoGpa
		elif player.hp >= 1.5:
			hpImage.texture = oneFiveGpa
		elif player.hp >= 1:
			hpImage.texture = oneGpa
	elif player == null and isDead == false:
		
		hpText.text = ""
		hpImage.texture = fiveGpa
		
		Engine.time_scale = 0
		gameOverUI.show()
		isDead = true
		
	

func printHello():
	print("Hello")


func _on_restart_button_pressed() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
	get_parent().get_parent().hide()
