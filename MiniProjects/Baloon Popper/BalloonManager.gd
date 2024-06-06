extends Node3D

#class_name  BalloonManager
@onready var score_label = $ScoreLabel

var score : int = 0

func increase_score(amount : int):
	score += amount
	score_label.text = "Score %s" % score

