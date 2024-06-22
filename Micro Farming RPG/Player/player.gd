extends CharacterBody2D

class_name Player

@export var speed:int = 100
var run:bool = false
var looking_left:bool = true
@onready var sprite_2d: Sprite2D = $Sprite2D


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	move_player()
	animate_player()


func animate_player() -> void:
	if velocity.x > 0 and looking_left:
		looking_left = false
		sprite_2d.flip_h = true
	elif velocity.x < 0 and not looking_left:
		looking_left = true
		sprite_2d.flip_h = false


func move_player() -> void:
	var move_speed = speed
	if Input.is_key_pressed(KEY_SHIFT):
		run = true
		move_speed *= 2
	
	var input = Input.get_vector("left", "right", "up", "down")
	velocity = input.normalized() * move_speed

	move_and_slide()
	
