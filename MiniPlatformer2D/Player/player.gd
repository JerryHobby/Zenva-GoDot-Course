extends CharacterBody2D

var move_speed : float = 100.0
var jump_force : float = 250.0
var gravity : float = 500.0
@onready var score_label = $CanvasLayer/ScoreLabel

var score : int = 0
@onready var sprite = $Sprite
var gameover:bool = false


func _ready():
	update_score_label()


func _physics_process(delta):
	
	if gameover:
		get_tree().reload_current_scene()
		return
	
	if not is_on_floor():
		velocity.y += gravity * delta

	velocity.x = 0
	
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x -= move_speed
		sprite.play("walk")
		sprite.flip_h = false
	
	elif Input.is_key_pressed(KEY_RIGHT):
		velocity.x += move_speed
		sprite.play("walk")
		sprite.flip_h = true
	else:
		sprite.stop()
	
	
	if Input.is_key_pressed(KEY_UP) and is_on_floor():
		velocity.y -= jump_force

	move_and_slide()
	
	if global_position.y > 100:
		gameover = true
		game_over()


func game_over():
	gameover = true


func add_score(amount:int):
	score += amount
	update_score_label()


func update_score_label():
	score_label.text = "Score: %s" % score
