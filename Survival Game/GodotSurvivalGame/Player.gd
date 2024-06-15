extends CharacterBody3D

var camera : Camera3D
var head : Node3D

var move_speed : float = 5.0
var jump_force : float = 5.0
var gravity : float = 9.0

var look_sens : float = 0.5
var min_x_rot : float = -85.0
var max_x_rot : float = 85.0
var mouse_dir : Vector2

func _ready():
	# disable the mouse cursor
	# i've disabled this by default because it can be awkward to work around
	#Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
	
	# get our nodes and detatch the camera
	camera = get_node("Camera3D")
	head = get_node("Head")
	remove_child(camera)
	get_node("/root/Main").add_child.call_deferred(camera)

func _input(event):
	# when we move the mouse
	if event is InputEventMouseMotion:
		# look up and down
		camera.rotation_degrees.x += event.relative.y * -look_sens
		camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, min_x_rot, max_x_rot)
		
		# look left and right
		camera.rotation_degrees.y += event.relative.x * -look_sens
	
func _process(delta):
	# have the camera follow our head position
	camera.position = head.global_position
	
func _physics_process(delta):
	# if we are in the air, apply gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# when we press SPACEBAR and we're on the ground, jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force
	
	# get our movement inputs and calculate an input Vector2
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	
	# convert that to a movement direction relative to our camera
	var dir = camera.basis.z * input.y + camera.basis.x * input.x
	dir.y = 0
	dir = dir.normalized()
	
	# set our velocity
	velocity.x = dir.x * move_speed
	velocity.z = dir.z * move_speed
	
	# apply the velocity and move the player
	move_and_slide()
	
	
	
	
	
