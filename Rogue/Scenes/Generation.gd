extends Node

@onready var room_scene:PackedScene = preload("res://Scenes/room.tscn")

var room_count:int
var rooms_instantiated:bool = false
var first_room_position:Vector2

var map:Array
var room_nodes:Array

@onready var player = $"../Player"

func _ready():
	for i in range(GameManager.map_width):
		map.append([])
		for j in range(GameManager.map_height):
			map[i].append(false)
	
	seed(GameManager.game_seed)
	generate()


func reset_map():
	for i in range(GameManager.map_width):
		for j in range(GameManager.map_height):
			map[i][j] = (false)
	room_count = 0
	rooms_instantiated = false
	room_nodes = []


func generate() -> void:
	var startx = 3 #int(map_width/2)
	var starty = 3 #int(map_height/2)
	check_room(
		startx, 
		starty, 
		0, 
		Vector2.ZERO, 
		true)
	instantiate_rooms()
	var room_center:Vector2 = GameManager.room_center

	player.position = first_room_position * GameManager.pixel_width + room_center


func check_room(
	x:int, 
	y:int, 
	remaining:int, 
	general_direction:Vector2, 
	first_room:bool = false) -> void:
	
	# is map full?
	if room_count >= GameManager.rooms_to_generate - 1:
		return
	
	# is outside of map dimensions?
	if x < 0 or x > GameManager.map_width -1 \
	or y < 0 or y > GameManager.map_height -1:
		return
	
	# is enough rooms generated?
	if not first_room and remaining <= 0:
		return
	
	# is this room already created?
	if map[x][y] == true:
		return

	if first_room:
		first_room_position = Vector2(x, y)
	
	# let's build the room
	room_count += 1
	map[x][y] = true
	
	const LIKELY = 0.2
	const UNLIKELY = 0.8
	var north:bool = randf() > (LIKELY if general_direction == Vector2.UP else UNLIKELY)
	var south:bool = randf() > (LIKELY if general_direction == Vector2.DOWN else UNLIKELY)
	var east:bool = randf() > (LIKELY if general_direction == Vector2.LEFT else UNLIKELY)
	var west:bool = randf() > (LIKELY if general_direction == Vector2.RIGHT else UNLIKELY)

	var max_remaining = int(GameManager.rooms_to_generate / 4)
	
	if north or first_room:
		check_room(x, y + 1, max_remaining if first_room else remaining - 1, Vector2.UP if first_room else general_direction)
	if south or first_room:
		check_room(x, y - 1, max_remaining if first_room else remaining - 1, Vector2.DOWN if first_room else general_direction)
	if east or first_room:
		check_room(x + 1, y, max_remaining if first_room else remaining - 1, Vector2.RIGHT if first_room else general_direction)
	if west or first_room:
		check_room(x - 1, y, max_remaining if first_room else remaining - 1, Vector2.LEFT if first_room else general_direction)


func instantiate_rooms() -> void:
	if rooms_instantiated:
		return
	
	rooms_instantiated = true
	
	for x in range(GameManager.map_width):
		for y in range(GameManager.map_height):
			if map[x][y] == false:
				continue
			
			var room = room_scene.instantiate()

			room.position = Vector2(x, y) * GameManager.pixel_width

			# open the connecting doors
			if y > 0 and map[x][y-1]:
				room.north()
				
			if y < GameManager.map_height - 1 and map[x][y+1]:
				room.south()
				
			if x > 0 and map[x-1][y]:
				room.west()
				
			if x < GameManager.map_width - 1 and map[x+1][y]:
				room.east()
			
			if first_room_position != Vector2(x, y):
				room.generation = self

			$"..".call_deferred("add_child", room)
			room_nodes.append(room)
	
	get_tree().create_timer(1)
	calculate_key_and_exit()


func calculate_key_and_exit() -> void:
	var max_distance:float = 0
	var room_a:Node2D = null
	var room_b:Node2D = null
	
	for a:Node2D in room_nodes:
		for b:Node2D in room_nodes:
			var distance = a.position.distance_to(b.position)
			if distance > max_distance:
				room_a = a
				room_b = b
				max_distance = distance
	
	room_a.spawn_node(room_a.key_node, 1, 1)
	room_b.spawn_node(room_b.exit_door_node, 1, 1)
	
	

