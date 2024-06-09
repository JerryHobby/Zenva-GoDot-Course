extends CharacterBody3D

var move_speed:float = 6.0
var jump_force:float = 8.0
var gravity:float = 20.0

var facing_angle:float
var rotation_speed:float = 0.25

var gameover:bool = false

var score:int
@onready var label = $"../hud/Label"

@onready var model:MeshInstance3D = $Model

func _physics_process(delta):
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	input *= -1
	var dir = Vector3(input.x, 0, input.y)
	
	if gameover:
		get_tree().reload_current_scene()
		return
	
	if global_position.y < -5:
		game_over()
		return

	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y += jump_force
		
	velocity.x = dir.x * move_speed
	velocity.z = dir.z * move_speed
	
	if input.length() > 0:
		facing_angle = Vector2(input.y, input.x).angle()
		
	model.rotation.y = lerp(model.rotation.y, facing_angle, rotation_speed)

	move_and_slide()


func game_over():
	gameover = true


func add_score(amount:int):
	score += amount
	label.text = "Score: %s" % score

