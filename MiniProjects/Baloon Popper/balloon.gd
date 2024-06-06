extends Area3D
@onready var mesh = $MeshInstance3D

@export var clicks_to_pop : int = 5
@export var size_increase : float = 0.2
@export var score_to_give : int = 1

@export var color = Color(0, 255, 0, .5)

# Called when the node enters the scene tree for the first time.
func _ready():
	#mesh.material_override.albedo_color = color
	pass


@onready var mesh_instance_3d = $MeshInstance3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_input_event(camera, event, position, normal, shape_idx):
	if not (event is InputEventMouseButton and event.pressed):
		return
		
	if event.button_index == MOUSE_BUTTON_LEFT:
		hit()
		return



func hit():
	clicks_to_pop -= 1
	scale += Vector3.ONE * size_increase
	
	if clicks_to_pop == 0:
		get_node("/root/Main").increase_score(score_to_give)
		queue_free()


