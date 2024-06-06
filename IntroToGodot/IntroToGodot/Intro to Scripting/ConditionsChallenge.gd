extends Node

var game_over : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	if game_over == true:
		print("Go to menu")
	else:
		print("Keep playing")
