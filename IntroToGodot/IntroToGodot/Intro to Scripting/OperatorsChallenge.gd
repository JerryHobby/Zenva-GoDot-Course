extends Node

var money : int = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	money += 5
	money *= 2
	money -= 3
	money /= 2
	
	print(money)
