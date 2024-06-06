extends Node

var score : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	score += 1
	score += 2
	print(score)
	
	score -= 2
	print(score)
	
	score *= 10
	print(score)
	
	score /= 2
	print(score)
	
	var a : int = 10
	var b : int = a * 2
