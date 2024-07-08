extends Control
const WORLD = preload("res://Scenes/world.tscn")
@onready var seed_input = $"."/Play/HBoxContainer/Seed

func _ready():
	var rand_seed:int = randi_range(0, int(Time.get_unix_time_from_system()))
	GameManager.game_seed = rand_seed
	seed_input.text = str(rand_seed)


func _on_play_button_pressed():
	get_tree().change_scene_to_packed(WORLD)


func _on_quit_button_pressed():
	get_tree().quit()


func _on_seed_text_changed(new_text):
	GameManager.seed = int(new_text)

