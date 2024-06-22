extends Node2D

@onready var tile_map: TileMap = $TileMap

const dirt_layer:int = 0
const dirt_tile_set:int = 0
const grass_tile:Vector2i = Vector2i(0,0)
const dirt_tile:Vector2i = Vector2i(1,0)
const wet_dirt_tile:Vector2i = Vector2i(2,0)

const crop_layer:int = 1
const wheat_tile_set:int = 1

const seed_tiles:Array[Vector2i] = [Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0)]

enum farming_modes {DIRT, SEEDS, WATER, HARVEST}
var farming_mode_state:farming_modes = farming_modes.DIRT

@onready var day_label: Label = $CanvasLayer/Control/DayLabel
@onready var seeds_label: Label = $CanvasLayer/Control/SeedsLabel
@onready var next_day_button: Button = $CanvasLayer/Control/NextDayButton
@onready var buy_seeds_button: Button = $CanvasLayer/Control/BuySeedsButton
@onready var tool_label: Label = $CanvasLayer/Control/ToolLabel
@onready var money_label: Label = $CanvasLayer/Control/MoneyLabel


var day:int = 1
var tools:Array = ["Hoe", "Seed Bag", "Watering Can", "Sickle"]
var money:int = 0
var seeds_available:int = 4





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	manage_tools()
	manage_ui()
	
	#if Input.is_action_just_pressed("ui_accept"):
		#next_day()
	
	if Input.is_action_pressed("interact"):
		var mouse_pos:Vector2 = get_global_mouse_position()
		var tile_map_pos:Vector2i

		tile_map_pos = tile_map.local_to_map(mouse_pos)

		match farming_mode_state:
			farming_modes.DIRT:
				use_dirt(tile_map_pos)
			farming_modes.SEEDS:
				use_seeds(tile_map_pos)
			farming_modes.WATER:
				use_water(tile_map_pos)
			farming_modes.HARVEST:
				use_harvest(tile_map_pos)


func use_water(tile_map_pos:Vector2i):
	
	var can_water_dirt:bool = retrieve_custom_data(tile_map_pos, "can_water", dirt_layer)

	if not can_water_dirt:
		return
		
	tile_map.set_cell(dirt_layer, tile_map_pos, dirt_tile_set, wet_dirt_tile )


func use_harvest(tile_map_pos:Vector2i):
	var can_harvest:bool = retrieve_custom_data(tile_map_pos, "can_harvest", crop_layer)

	if not can_harvest:
		return
		
	tile_map.erase_cell(crop_layer, tile_map_pos )
	money += 10


func buy_seeds():
	if not money:
		return
	
	money -= 1
	seeds_available += 1
	print("Bought seeds")


func use_seeds(tile_map_pos:Vector2i):
	
	if not retrieve_custom_data(tile_map_pos, "can_place_seeds", dirt_layer):
		return
	if retrieve_custom_data(tile_map_pos, "has_seeds", crop_layer):
		return
	if not seeds_available:
		return
	
	tile_map.set_cell(crop_layer, tile_map_pos, wheat_tile_set, seed_tiles[0] )
	seeds_available -= 1


func use_dirt(tile_map_pos:Vector2i):
	tile_map.set_cell(dirt_layer, tile_map_pos, dirt_tile_set, dirt_tile )
	tile_map.erase_cell(crop_layer, tile_map_pos)


func retrieve_custom_data(tile_map_pos:Vector2i, custom_data_layer:String, layer:int):
	var tile_data:TileData = tile_map.get_cell_tile_data(layer, tile_map_pos)

	if tile_data:
		return tile_data.get_custom_data(custom_data_layer)
	else:
		return false


func manage_tools() -> void:
	if Input.is_action_just_pressed("dirt"):
		farming_mode_state = farming_modes.DIRT
		
	if Input.is_action_just_pressed("seeds"):
		farming_mode_state = farming_modes.SEEDS

	if Input.is_action_just_pressed("water"):
		farming_mode_state = farming_modes.WATER

	if Input.is_action_just_pressed("harvest"):
		farming_mode_state = farming_modes.HARVEST


func next_day() -> void:
	day += 1
	for cell in tile_map.get_used_cells(crop_layer):
		var cell_pos:Vector2i = Vector2i(cell.x, cell.y)
		var cell_level = retrieve_custom_data(cell_pos, "seed_level", crop_layer )
		
		if cell_level != 3:
			if retrieve_custom_data(cell_pos, "has_been_watered", dirt_layer):
				tile_map.set_cell(crop_layer, cell_pos, wheat_tile_set, seed_tiles[cell_level +1] )

	for cell in tile_map.get_used_cells(dirt_layer):
		var cell_pos:Vector2i = Vector2i(cell.x, cell.y)

		if retrieve_custom_data(cell_pos, "has_been_watered", dirt_layer):
			tile_map.set_cell(dirt_layer, cell_pos, dirt_tile_set, dirt_tile  )


func manage_ui() -> void:
	tool_label.text = "Tool: %s" % tools[farming_mode_state]
	day_label.text = "Day: %d" % day
	money_label.text = "Money: $%d" % money
	seeds_label.text = "Seeds: %d" % seeds_available 
	


func _on_next_day_button_pressed() -> void:
	next_day()


func _on_buy_seeds_button_pressed() -> void:
	buy_seeds()
