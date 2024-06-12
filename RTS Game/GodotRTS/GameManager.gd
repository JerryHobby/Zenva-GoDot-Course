extends Node2D

var selected_unit : CharacterBody2D
var players : Array[CharacterBody2D]
var enemies : Array[CharacterBody2D]

# called when an input is detected
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			_try_select_unit()
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			_try_command_unit()

# returns what we're currently hovering over
func _get_selected_unit ():
	var space = get_world_2d().direct_space_state
	var query = PhysicsPointQueryParameters2D.new()
	query.position = get_global_mouse_position()
	var intersection = space.intersect_point(query, 1)
	
	if !intersection.is_empty():
		return intersection[0].collider
		
	return null

# called when we left click
func _try_select_unit():
	var unit = _get_selected_unit()
	
	if unit != null and unit.is_player:
		_select_unit(unit)
	else:
		_unselect_unit()

# selects the given unit
func _select_unit (unit):
	_unselect_unit()
	selected_unit = unit
	selected_unit.toggle_selection_visual(true)

# unselects the current unit
func _unselect_unit():
	if selected_unit != null:
		selected_unit.toggle_selection_visual(false)
		
	selected_unit = null

# called when we right click
func _try_command_unit ():
	# if we have no selected unit - return
	if selected_unit == null:
		return
	
	# get the unit we're hovering over, if any
	var target = _get_selected_unit()
	
	# if we're right clicking an enemy, set them as our target
	if target != null and target.is_player == false:
		selected_unit.set_target(target)
	# otherwise move to our mouse position
	else:
		selected_unit.move_to_location(get_global_mouse_position())
	
	
	
	
