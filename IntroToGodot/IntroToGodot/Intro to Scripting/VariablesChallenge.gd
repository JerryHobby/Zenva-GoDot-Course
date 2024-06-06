extends Node

var country_name : String = "Australia"
var population : int = 25000000
var highest_altitude : float = 2.228
var landlocked : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print(country_name)
	print(population)
	print(highest_altitude)
	print(landlocked)
