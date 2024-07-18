extends CharacterBody2D

var rotation_speed:float =  10
var _rotation_dir:int
var _default_bullet_speed:float = 300.0


func _physics_process(_delta):
	self.rotation += rotation_speed * _rotation_dir * _delta
	move_and_slide()


func shoot(dir:Vector2, bullet_speed = _default_bullet_speed):
	_active(true)
	velocity = dir * bullet_speed
	if dir.x <= 0:
		_rotation_dir = -1
	else:
		_rotation_dir = 1


func _active(active:bool):
	visible = active
	if not active:
		global_position = Vector2(-1000, -1000)
		velocity = Vector2.ZERO


func _on_visible_on_screen_notifier_2d_screen_exited():
	_active(false)
