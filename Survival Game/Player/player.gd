extends CharacterBody3D

@onready var camera = $Camera3D
@onready var head = $Head
@onready var main = $".."

var move_speed:float = 5
var jump_force:float = 5
var gravity:float = 9

var look_sens:float = 1
var min_x_rot:float = -85
var max_x_rot:float = 85

var mouse_dir:Vector2
var cam_invert:int = -1


func _ready():
	remove_child(camera)
	main.add_child.call_deferred(camera)
	
	#Input.mouse_mode = Input.MOUSE_MODE_HIDDEN


func _input(event):

	if event is InputEventMouseMotion:
		camera.rotation_degrees.x += event.relative.y * look_sens * cam_invert
		camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, min_x_rot, max_x_rot)
		
		camera.rotation_degrees.y += event.relative.x * look_sens * cam_invert



func _process(delta):
	camera.position = head.global_position


func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force


	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var dir = camera.basis.z * input.y + camera.basis.x * input.x
	dir.y = 0
	dir = dir.normalized()
	
	velocity.x = dir.x * move_speed
	velocity.z = dir.z * move_speed
	
	move_and_slide()
