extends CharacterBody2D

class_name Player

@export var bulletInstance: PackedScene
@export var BulletTransform: Node2D

@export var hpLabel: Label
@export var scoreLabel: Label
@export var coinLabel: Label

@export var gameOverUI: Control

@export var fireRate = 0.1

var hp = 100
var score = 0
var coin = 0

func _ready() -> void:
	spawnBullets()
	pass

func _process(delta: float) -> void:
	hpLabel.text = "Health: " + str(hp)
	scoreLabel.text = "Score: " + str(score)
	coinLabel.text = "Coins: " + str(coin)
	
	if hp <= 0:
		gameOver()
		queue_free()
	
	

func spawnBullets():
	#SpawnBullet
	while true: 
		#print("Hello po, shoot")
		var instance = bulletInstance.instantiate()
		#instance.position = BulletTransform.position
		#add_child(instance)
		
		instance.position = BulletTransform.global_position
		if instance is Bullet:
			instance._owner = self
		get_parent().add_child(instance)
		
		await get_tree().create_timer(fireRate).timeout


func _physics_process(delta: float) -> void:
	position = get_global_mouse_position()
	
	#move_and_collide(get_global_mouse_position().normalized())
	
func takeDamage(damage: int):
	hp -= damage
	
func addCoin():
	coin += 1

func gameOver():
	Engine.time_scale = 0
	gameOverUI.show()
