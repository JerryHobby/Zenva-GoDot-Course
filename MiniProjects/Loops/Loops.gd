extends Node2D

@export var star_count : int = 200
const STAR = preload("res://Loops/star.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var size = get_viewport_rect().size
	var x:float = size.x / 2
	var y:float = size.y / 2


	print(size)
	
	
	for i in star_count:
		var star = STAR.instantiate()
		var xpos:float = randf_range(-x, x)
		var ypos:float = randf_range(-y, y)
		
		
		star.position = Vector2(xpos, ypos)

		add_child(star)





