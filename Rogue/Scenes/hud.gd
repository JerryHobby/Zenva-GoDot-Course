extends CanvasLayer

@onready var player = $"../Player"

@onready var heart_1 = $MarginContainer/HBoxContainer/LeftCol/HealthBar/Heart1
@onready var heart_2 = $MarginContainer/HBoxContainer/LeftCol/HealthBar/Heart2
@onready var heart_3 = $MarginContainer/HBoxContainer/LeftCol/HealthBar/Heart3
@onready var heart_4 = $MarginContainer/HBoxContainer/LeftCol/HealthBar/Heart4
@onready var heart_5 = $MarginContainer/HBoxContainer/LeftCol/HealthBar/Heart5


@onready var coins_label = $MarginContainer/HBoxContainer/LeftCol/CoinsLabel
@onready var level_label = $Minimap/LevelLabel
@onready var enemies_remaining_label = $MarginContainer/HBoxContainer/RightCol/EnemiesRemainingLabel
@onready var hearts_remaining_label = $MarginContainer/HBoxContainer/RightCol/HeartsRemainingLabel
@onready var coins_remaining_label = $MarginContainer/HBoxContainer/RightCol/CoinsRemainingLabel
@onready var key = $Key
@onready var seed_label = $MarginContainer/HBoxContainer/LeftCol/SeedLabel

@onready var generation = $"../Generation"
@onready var grid_container = $Minimap/GridContainer
const MINIMAP_GRID = preload("res://Scenes/minimap_grid.tscn")



func _ready():
	GameManager.on_health_updated.connect(on_health_updated)
	GameManager.on_coins_updated.connect(on_coins_updated)

	GameManager.on_enemy_count_updated.connect(on_enemy_count_updated)
	GameManager.on_coin_count_updated.connect(on_coin_count_updated)
	GameManager.on_heart_count_updated.connect(on_heart_count_updated)
	GameManager.on_level_updated.connect(on_level_updated)
	GameManager.on_keys_updated.connect(on_keys_updated)
	
	
	generate_minimap()
	
	on_health_updated()
	on_coins_updated()
	on_enemy_count_updated()
	on_coin_count_updated()
	on_heart_count_updated()
	on_level_updated()
	seed_label.text = "Seed: " + str(GameManager.game_seed)


func _process(_delta):
	update_minimap()


func on_health_updated():
	var health_pct:float = float(GameManager.get_health()) / float(GameManager.max_health)
	var step:float = 1.0 / 10.0 # 10 positions of health on 5 hearts bar
	
	if health_pct > 1 - (step * 1):
		heart_5.visible = true
		heart_5.frame = 1
	elif health_pct > 1 - (step * 2):
		heart_5.visible = true
		heart_5.frame = 0
	else:
		heart_5.visible = false
		
	if health_pct > 1 - (step * 3):
		heart_4.visible = true
		heart_4.frame = 1
	elif health_pct > 1 - (step * 4):
		heart_4.visible = true
		heart_4.frame = 0
	else:
		heart_4.visible = false
		
	if health_pct > 1 - (step * 5):
		heart_3.visible = true
		heart_3.frame = 1
	elif health_pct > 1 - (step * 6):
		heart_3.visible = true
		heart_3.frame = 0
	else:
		heart_3.visible = false

	if health_pct > 1 - (step * 7):
		heart_2.visible = true
		heart_2.frame = 1
	elif health_pct > 1 - (step * 8):
		heart_2.visible = true
		heart_2.frame = 0
	else:
		heart_2.visible = false

	if health_pct > 1 - (step * 9):
		heart_1.visible = true
		heart_1.frame = 1
	elif health_pct > 1 - (step * 10):
		heart_1.visible = true
		heart_1.frame = 0
	else:
		heart_1.visible = false


func on_coins_updated():
	coins_label.text = "Coins: %d" % GameManager.get_coins()


func on_enemy_count_updated():
	enemies_remaining_label.text = "Enemies Remaining: %d" % GameManager.get_enemy_count()


func on_coin_count_updated():
	coins_remaining_label.text = "Coins Remaining: %d" % GameManager.get_coin_count()


func on_heart_count_updated():
	hearts_remaining_label.text = "Hearts remaining: %d" % GameManager.get_heart_count()


func on_level_updated():
	level_label.text = "Level: %d" % GameManager.get_level()


func on_keys_updated():
	if GameManager.get_keys() > 0:
		key.modulate = Color(1, 1, 1, 1)


func generate_minimap():
	var width = GameManager.map_width
	var height = GameManager.map_height
	var map = generation.map
	
	grid_container.columns = width
	
	for i in range(height):
		for j in range(width):
			var panel = MINIMAP_GRID.instantiate()
			if map[j][i] == false:
				panel.modulate = "ffffff00"
			else:
				panel.is_room = true
			panel.pos = Vector2i(j, i)
			grid_container.add_child(panel)


func update_minimap():
	var pos:Vector2i = player.global_position / GameManager.pixel_width
	var panels = grid_container.get_children()
	
	for panel in panels:
		if panel.is_room:
			if panel.pos == pos:
				panel.modulate = "00ff00ff"
			else:
				panel.modulate = "ffffffff"
		else:
			panel.modulate = "ffffff00"

