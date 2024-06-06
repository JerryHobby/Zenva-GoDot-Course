extends RigidBody3D

@export var move_speed : float = 2.0

func _physics_process(delta):
	
	if Input.is_key_pressed(KEY_LEFT):
		linear_velocity.x = -move_speed
	if Input.is_key_pressed(KEY_RIGHT):
		linear_velocity.x = move_speed

func _on_body_entered(body):
	if body.is_in_group("Tree"):
		get_tree().reload_current_scene()
