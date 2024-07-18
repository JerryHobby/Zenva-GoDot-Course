extends CharacterBody2D

@onready var bullets = $Bullets
@onready var bullet_spawn_point = $BulletSpawnPoint
@onready var player = $Player
@onready var health_bar = $HealthBar

@export var health:int = 100
var is_alive:bool = true
var _current_health = health

@export var move_speed:int = 75
@export var bullet_speed:float = 200.0
var _facing_direction:Vector2 = Vector2.DOWN # Looking downward


func _physics_process(delta):
	
	if not is_alive:
		return
	
	var move_dir:Vector2 = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")).normalized()

	move(move_dir, delta)
	_facing_direction = face_direction(move_dir)
	shoot(_facing_direction)


func move(dir:Vector2, _delta):
	velocity = dir * move_speed
	move_and_slide()


func shoot(dir:Vector2):

	if Input.is_action_just_pressed("shoot"):
		bullet_spawn_point.position = dir * 20
		var bullet = bullets.get_bullet()
		bullet.global_position = bullet_spawn_point.global_position
		bullet.shoot(dir, bullet_speed)


func face_direction(dir:Vector2) -> Vector2:
	var new_dir:Vector2 = _facing_direction
	
	if dir.x > 0:
		new_dir = Vector2.RIGHT
		player.frame = 1
		player.flip_h = false
		
	elif dir.x < 0:
		new_dir = Vector2.LEFT
		player.frame = 1
		player.flip_h = true
		
	elif dir.y < 0:
		new_dir = Vector2.UP
		player.frame = 2
		player.flip_h = false

	elif dir.y > 0:
		new_dir = Vector2.DOWN
		player.frame = 0
		player.flip_h = false
	
	return new_dir


func die():
	is_alive = false


func take_damage(amount:int):
	_current_health -= amount
	
	if _current_health < 0:
		_current_health = 0
		health_bar.value = _current_health
		die()
	else:
		health_bar.value = _current_health


func heal(amount:int):
	_current_health += amount
	if _current_health > health:
		_current_health = health
	health_bar.value = _current_health
