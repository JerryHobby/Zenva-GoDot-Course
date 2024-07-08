extends Node2D

@export var inside_width:int = 10
@export var inside_height:int = 10
var used_positions:Array 

@onready var north_door = $"North Door"
@onready var south_door = $"South Door"
@onready var east_door = $"East Door"
@onready var west_door = $"West Door"
@onready var north_wall = $"North Wall"
@onready var south_wall = $"South Wall"
@onready var west_wall = $"West Wall"
@onready var east_wall = $"East Wall"

@onready var generation:Node2D

var enemy_node:PackedScene = load("res://Enemies/enemy.tscn")
var coin_node:PackedScene  = load("res://Scenes/coin.tscn")
var heart_node:PackedScene = load("res://Scenes/heart.tscn")

var key_node:PackedScene = load("res://Scenes/key_node.tscn")
var exit_door_node:PackedScene = load("res://Scenes/exit_door.tscn")


func _ready():
	generate_interior()

func north():
	$"North Wall".queue_free()
	$"North Door".show()


func south():
	$"South Wall".queue_free()
	$"South Door".show()


func east():
	$"East Wall".queue_free()
	$"East Door".show()


func west():
	$"West Wall".queue_free()
	$"West Door".show()


func generate_interior() -> void:

	if randi_range(0, 1) < GameManager.enemy_spawn_chance:
		spawn_node(enemy_node, GameManager.min_enemies_per_room, GameManager.max_enemies_per_room)

	if randi_range(0, 1) < GameManager.coin_spawn_chance:
		spawn_node(coin_node, GameManager.min_coins_per_room, GameManager.max_coins_per_room)
	
	if randi_range(0, 1) < GameManager.heart_spawn_chance:
		spawn_node(heart_node, GameManager.min_hearts_per_room, GameManager.max_hearts_per_room)
	
	
func spawn_node(node_scene:PackedScene, min_inst:int = 0, max_inst:int = 1) -> void:
	if max_inst == 0 or max_inst < min_inst:
		return
	
	var count = randi_range(min_inst, max_inst)
	
	for i in range(0, count):
		var node = node_scene.instantiate()
		add_child(node)
		
		while true:
			var node_pos = Vector2(
				GameManager.tile_size * randi_range(2, inside_width - 1) - int(GameManager.tile_size/2),
				GameManager.tile_size * randi_range(2, inside_height - 1) - int(GameManager.tile_size/2)
				) 

			var used = used_positions.find(node_pos)
			
			if used == null or used == -1:
				node.position = node_pos
				used_positions.append(node_pos)
				break
	

	if node_scene == enemy_node:
		GameManager.update_enemy_count(count)
		get_tree().get_first_node_in_group("Enemy_Manager").check_enemies()

	if node_scene == coin_node:
		GameManager.update_coin_count(count)
		
	if node_scene == heart_node:
		GameManager.update_heart_count(count)




