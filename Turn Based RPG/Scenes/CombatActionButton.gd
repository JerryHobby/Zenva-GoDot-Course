extends Button

var combat_action:CombatAction

@onready var battle_scene = $"../.."

func _on_pressed():
	battle_scene.cur_char.cast_combat_action(combat_action)
	pass # Replace with function body.
