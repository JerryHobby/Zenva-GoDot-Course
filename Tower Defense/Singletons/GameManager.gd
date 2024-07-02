extends Node

var ufo_max_health:int
var ufo_speed:float
var ufo_wave_size:int
var ufo_spawn_delay:float
var ufo_wave_delay:float
var ufo_score:int
var ufo_cash:float
var ufo_damage_to_player:int
var ufo_healing_to_player:int

var cannon_shoot_timer:float
var cannon_bullet_damage:float
var cannon_bullet_speed:float
var cannon_price:int
var cannon_range:float
var blaster_price:int
var blaster_range:float

var _max_player_health:int
var _player_health:int
var _player_cash:int
var _player_score:int

var _wave:int
var _enemies_alive:int
var _game_over:bool

signal on_score_update(score:int)
signal on_health_update(health:int)
signal on_cash_update(cash:int)
signal on_wave_update(wave:int)
signal on_enemies_alive_update(enemies_alive:int)


func _ready():
	print("GM Ready")
	reset()


func reset():
	ufo_max_health = 20
	ufo_speed = 1.2
	ufo_wave_size = 3
	ufo_spawn_delay = 1
	ufo_wave_delay = 5
	ufo_score = 1
	ufo_cash = 20
	ufo_damage_to_player = -20
	ufo_healing_to_player = 2
	
	cannon_shoot_timer = .35
	cannon_bullet_damage = 5.1
	cannon_bullet_speed = 20
	cannon_price = 500
	blaster_price = 750
	cannon_range = 3.0
	blaster_range = 6.0
	
	_max_player_health = 100
	_player_health = _max_player_health
	_player_cash = 500
	_player_score = 0

	_wave = 0
	_enemies_alive = 0
	_game_over = false


###################################################
func get_score() -> int:
	return _player_score


func set_score(amount:int):
	_player_score = amount
	on_score_update.emit(_player_score)


func add_score(amount:int):
	set_score(_player_score + amount)


###################################################
func get_wave() -> int:
	return _wave


func set_wave(amount:int):
	_wave = amount
	on_wave_update.emit(_wave)
	
	#ufo_spawn_delay -= 0.1 * _wave
	#ufo_wave_delay -= 0.1  * _wave
	ufo_max_health += 0.1 * _wave
	ufo_cash *= 1.02
	ufo_speed *= 1.01
	#cannon_bullet_damage += 0.1 * _wave


func add_wave(amount:int):
	set_wave(_wave + amount)


###################################################
func get_health() -> int:
	return _player_health


func set_health(amount:int):
	_player_health = amount
	if _player_health > _max_player_health:
		_player_health = _max_player_health
	
	if _player_health <= 0:
		game_over()
		
	on_health_update.emit(_player_health)
	


func add_health(amount:int):
	set_health(_player_health + amount)


###################################################
func get_cash() -> int:
	return int(_player_cash)


func set_cash(amount:float):
	_player_cash = amount
	on_cash_update.emit(_player_cash)


func add_cash(amount:float):
	set_cash(_player_cash + amount)


###################################################
func get_enemies_alive() -> int:
	return _enemies_alive


func set_enemies_alive(amount:int):
	_enemies_alive = amount
	on_enemies_alive_update.emit(_enemies_alive)


func add_enemies_alive(amount:int):
	set_enemies_alive(_enemies_alive + amount)

func game_over():
	if _game_over == true:
		return
	
	_game_over = true
	get_tree().change_scene_to_file("res://Scenes/game_over.tscn")


func get_game_over():
	return _game_over
