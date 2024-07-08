extends Control

@onready var seed_input = $Play/HBoxContainer/Seed
@onready var score_label = $Play/ScoreLabel
@onready var level_label = $Play/LevelLabel

const WORLD:PackedScene = preload("res://Scenes/world.tscn")


func _ready():
	var rand_seed:int = randi_range(0, int(Time.get_unix_time_from_system()))
	GameManager.game_seed = rand_seed
	seed_input.text = str(rand_seed)
	
	score_label.text = "Coins: %d" % GameManager.get_coins()
	level_label.text = "Level: %d" % GameManager.get_level()


func _on_play_button_pressed():
	get_tree().change_scene_to_packed(WORLD)
	GameManager.reload()


func _on_quit_button_pressed():
	get_tree().quit()


func _on_seed_text_changed(new_text):
	GameManager.seed = int(new_text)

