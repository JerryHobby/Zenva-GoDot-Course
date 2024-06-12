extends CharacterBody2D

class_name Unit

@export var is_player:bool = true

@export var health:int  = 100
@export var damage:int = 20

@export var move_speed:float = 80.0
@export var attack_range:float = 50
@export var attack_rate:float = 0.5

var last_attack_time:float
var target:CharacterBody2D

@onready var agent = $NavigationAgent2D
@onready var sprite = $Sprite2D
@onready var debug_label = $DebugLabel

@onready var game_manager = get_node("/root/Main")

func _ready():
	game_manager 
	if is_player:
		game_manager.players.append(self)
	else:
		game_manager.enemies.append(self)
	


func _physics_process(_delta):
	
	update_label()
	
	if agent.is_navigation_finished():
		return

	var direction = global_position.direction_to(agent.get_next_path_position())
	velocity = direction * move_speed
	move_and_slide()


func _process(_delta):
	_target_check()


func _target_check():
	if target == null:
		return
		
	var dist = global_position.distance_to(target.global_position)
	
	if dist <= attack_range:
		agent.target_position = global_position
		_try_attack_target()
	else:
		agent.target_position = target.global_position


func move_to_location(location):
	set_target(null)
	agent.target_position = location


func set_target(new_target):
	target = new_target
	

func _try_attack_target():
	var cur_time = Time.get_unix_time_from_system()
	if cur_time - last_attack_time > attack_rate:
		target.take_damage(damage)
		last_attack_time = cur_time


func take_damage(amount:int):
	print("Taking damage ", amount)
	health -= amount
	
	if health <= 0:
		delete_array_index()
		queue_free()
	
	sprite.modulate = Color("ff6666")
	await get_tree().create_timer(0.1).timeout
	sprite.modulate = Color.WHITE


func update_label():
	
	var pos = "Pos: (%d, %d)" % [global_position.x, global_position.y]
	var players = "Players: %d" % game_manager.players.size()
	var enemies = "Enemies: %d" % game_manager.enemies.size()
	
	debug_label.text = "%s\n%s\n%s" % [pos, players, enemies]


func toggle_selected_visual(_show:bool):
	pass


func delete_array_index():
	game_manager.players.erase(self)
	game_manager.enemies.erase(self)
