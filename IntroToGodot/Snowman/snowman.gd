extends Node3D

var direction : float = 1
var speed : float = 25
var range : float = 8

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	print(position.x)
	print(direction)

	if position.x >= range:
		direction = -1;
	
	if position.x <= -range:
		direction  = 1;
	
	position.x += (speed * direction * delta);

