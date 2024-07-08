extends Node

var sfx_volume_db:float = -15.0

var enemy_spawn_chance:float = 0.7
var coin_spawn_chance:float = 0.8
var heart_spawn_chance:float = 0.7

var min_enemies_per_room:int = 1
var min_coins_per_room:int = 0
var min_hearts_per_room:int = 1

var max_enemies_per_room:int = 2
var max_coins_per_room:int = 3
var max_hearts_per_room:int = 1

var health_per_heart:int = 5
var coins_per_coin:int = 10

var tile_size = 48
var room_size = 17
var pixel_width = tile_size * room_size
var room_center:Vector2 = Vector2(250, 250)

var map_width: int = 7
var map_height:int = map_width * 2
var rooms_to_generate:int = 10
var game_seed:int = 0

var enemy_heatlh:int = 3
var enemy_damage_dealt:int = 1
var enemy_attack_chance:float = 0.5

# player vars
var max_health:int = 8
var _health:int = max_health
var _coins:int = 0
var _level:int = 1
var _keys:int = 0
var damage_dealt:int = 1


var _enemy_count:int = 0
var _coin_count:int = 0
var _heart_count:int = 0

signal on_health_updated()
signal on_coins_updated()

signal on_enemy_count_updated()
signal on_coin_count_updated()
signal on_heart_count_updated()
signal on_level_updated()
signal on_level_complete()
signal on_keys_updated()


func reload() -> void:
	# reset vars
	set_health(max_health)
	set_enemy_count(0)
	set_coin_count(0)
	set_heart_count(0)
	set_coins(0)
	
	# reload scene
	get_tree().reload_current_scene()


func next_level() -> void:
	game_seed = randi_range(0, int(Time.get_unix_time_from_system()))
	max_health += 4
	health_per_heart += 2
	max_enemies_per_room += 1
	enemy_damage_dealt += 1
	max_coins_per_room  += 1
	max_hearts_per_room += 1
	coins_per_coin += _level
	
	set_health(max_health)
	set_enemy_count(0)
	set_coin_count(0)
	set_heart_count(0)
	set_keys(0)
	update_level(1)
	
	get_tree().reload_current_scene()


#################################

func get_health() -> int:
	return _health


func set_health(amount:int) -> void:
	_health = amount
	if _health > max_health:
		_health = max_health
		
	on_health_updated.emit()


func update_health(amount:int) -> void:
	set_health(_health + amount)


#################################

func get_coins() -> int:
	return _coins


func set_coins(amount:int) -> void:
	_coins = amount
	on_coins_updated.emit()


func update_coins(amount:int) -> void:
	set_coins(_coins + amount)


#################################

func get_heart_count() -> int:
	return _heart_count


func set_heart_count(amount:int) -> void:
	_heart_count = amount
	on_heart_count_updated.emit()


func update_heart_count(amount:int) -> void:
	set_heart_count(_heart_count + amount)


#################################

func get_coin_count() -> int:
	return _coin_count


func set_coin_count(amount:int) -> void:
	_coin_count = amount
	on_coin_count_updated.emit()


func update_coin_count(amount:int) -> void:
	set_coin_count(_coin_count + amount)


#################################

func get_enemy_count() -> int:
	return _enemy_count


func set_enemy_count(amount:int) -> void:
	_enemy_count = amount
	on_enemy_count_updated.emit()


func update_enemy_count(amount:int) -> void:
	set_enemy_count(_enemy_count + amount)


#################################

func get_level() -> int:
	return _level


func set_level(amount:int) -> void:
	_level = amount
	on_level_updated.emit()


func update_level(amount:int) -> void:
	set_level(_level + amount)

#################################

func get_keys() -> int:
	return _keys


func set_keys(amount:int) -> void:
	_keys = amount
	on_keys_updated.emit()


func update_keys(amount:int) -> void:
	set_keys(_keys + amount)

