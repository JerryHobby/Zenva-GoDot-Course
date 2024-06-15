extends Node

class_name Need


var value:float

@export var max_value:float
@export var start_value:float
@export var regen_rate:float
@export var decay_rate:float
@export var ui_bar:Node


func add(amount:float):
	value += amount
	if value > max_value:
		value = max_value


func subtract(amount:float):
	value -= amount
	if value < 0:
		value = 0

func update_bar():
	ui_bar.update_value(value, max_value)


