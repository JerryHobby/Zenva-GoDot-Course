extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	var result = _add(10, 25)
	print(result)
	
	var game_over = _has_won(120)
	print(game_over)
	
func _add (a, b):
	var sum = a + b
	return sum
	
func _welcome_message ():
	print("The function was called!")

func _has_won (score):
	if score >= 100:
		return true
	else:
		return false
