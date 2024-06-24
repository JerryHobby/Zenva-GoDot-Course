extends Node

var _score:int = 0
var _speed:float = 100.0

const JUMP_VELOCITY = -525.0


func add_score(amount:int):
	_score += amount


func get_score() -> int:
	return _score


func reset_game():
	_score = 0

func increase_speed(amount):
	_speed += amount


func get_speed() -> float:
	return _speed
