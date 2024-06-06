extends Node

var score : int = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	if score == 10:
		print("You win!")
		
	if score > 5:
		print("Score is greater than 5")
		
	var a : int = 50
	var b : int = 100
	
	if a < b:
		print("a is less than b")
		
	if a != b:
		print("a is NOT equal to b")
		
	if score > 80:
		print("A")
	elif score > 60:
		print("B")
	elif score > 30:
		print("C")
	else:
		print("D")
