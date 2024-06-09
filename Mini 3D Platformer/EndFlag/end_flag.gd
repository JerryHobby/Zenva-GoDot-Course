extends Node3D

@export_file("*.tscn") var next_level
@export var award_points:int = 100

var die:bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if die:
		queue_free()
		return



func _on_end_flag_body_entered(body):
	if body.is_in_group("Player"):
		body.add_score(award_points)
		get_tree().change_scene_to_file(next_level)
		die = true

