extends Node2D

@onready var player = $"../Player"

var enemies:Array

const ENEMY = preload("res://Enemies/enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	player.on_player_moved.connect(on_player_moved)
	check_enemies()


func check_enemies():
	enemies = get_tree().get_nodes_in_group("Enemy")


func on_player_moved():
	for enemy in enemies:
		if not enemy:
			continue
		
		enemy.move()
			
