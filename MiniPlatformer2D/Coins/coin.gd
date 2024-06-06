extends Area2D

@export var points : int = 10

var die : bool = false

func _process(_delta):
	if die:
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.add_score(points)
		die = true

