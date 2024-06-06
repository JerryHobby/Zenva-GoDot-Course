extends RigidBody3D

@export var move_speed : float = 15


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_key_pressed(KEY_LEFT):
		linear_velocity.x -= move_speed * delta
	if Input.is_key_pressed(KEY_RIGHT):
		linear_velocity.x += move_speed * delta


func _on_body_entered(body):
	if body.is_in_group("tree"):
		print("ouch!")
		await get_tree().reload_current_scene()


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):

	if body_shape_index == 3:
		print("WIN!")
		await get_tree().reload_current_scene()
