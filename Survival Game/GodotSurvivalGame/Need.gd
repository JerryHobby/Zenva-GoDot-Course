extends Node
class_name Need

var value : float
@export var max_value : float
@export var start_value : float
@export var regen_rate : float
@export var decay_rate : float
@export var ui_bar : Node

# increase the need value
func add (amount):
	value += amount
	
	if value > max_value:
		value = max_value

# decrease the need value
func subtract (amount):
	value -= amount
	
	if value < 0:
		value = 0

# update the UI bar and text	
func update_ui_bar ():
	ui_bar.update_value(value, max_value)
