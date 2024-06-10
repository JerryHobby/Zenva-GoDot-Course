extends VBoxContainer

@export var buttons:Array


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_battle_scene_character_begin_turn(character):
	if not character.is_player:
		return

	visible = true
	_display_combat_actions(character.combat_actions)
	


func _on_battle_scene_character_end_turn(_character):
	visible = false


func _display_combat_actions(combat_actions):
	for i in len(buttons):
		var button = get_node(buttons[i])
		
		if i < len(combat_actions):
			button.visible = true
			button.text = combat_actions[i].display_name
			button.combat_action = combat_actions[i]
		else:
			button.visible = false
