extends Node3D

@onready var path_3d: Path3D = $Path3D
const CANNON = preload("res://Towers/cannon.tscn")
const BLASTER = preload("res://Towers/blaster.tscn")
const ENEMY:PackedScene = preload("res://Enemies/ufo.tscn")
@onready var camera_3d = $Camera3D
@onready var spawn_timer: Timer = $SpawnTimer
@onready var wave_timer: Timer = $WaveTimer
@onready var indicator = $Indicator
@onready var hud = $Hud


const GREEN = preload("res://Resources/green.tres")
const RED = preload("res://Resources/red.tres")
const YELLOW = preload("res://Resources/yellow.tres")


@onready var enemies_to_spawn:int = GameManager.ufo_wave_size


var can_spawn:bool = false
var in_build_menu:bool = false
@onready var shop:Panel = $Hud/Shop

var collider:CollisionObject3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	wave_timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#if GameManager.get_game_over():
		#return

	wave_manager()
	handle_player_controls()
	handle_ui()


func handle_player_controls():
	var space_state:PhysicsDirectSpaceState3D = get_world_3d().direct_space_state
	var mouse_pos:Vector2 = get_viewport().get_mouse_position()

	var origin:Vector3 = camera_3d.project_ray_origin(mouse_pos)
	var end:Vector3 = origin + camera_3d.project_ray_normal(mouse_pos) * 100
	
	var ray:PhysicsRayQueryParameters3D = PhysicsRayQueryParameters3D.create(origin, end)
	ray.collide_with_bodies = true
	
	var ray_result:Dictionary = space_state.intersect_ray(ray)
	
	if not in_build_menu:
		if ray_result.size() > 0:
			collider = ray_result.get("collider")
			indicator.global_position = collider.global_position + Vector3(0, 0.2, 0)

			if collider.is_in_group("Empty"):
				show_indicator(true)
				if Input.is_action_just_pressed("interact"):
					in_build_menu = true
			else:
				show_indicator(false)
		else:
			show_indicator(false)


func handle_ui():
	shop.visible = in_build_menu


func show_indicator(value:bool):
	var cash = GameManager.get_cash()
	var price = GameManager.cannon_price
	
	if cash < price and value == true:
		# color = yellow
		indicator.set_surface_override_material(0, YELLOW)
		indicator.visible = value
	elif  cash >= price and value == true:
		# color = green
		indicator.set_surface_override_material(0, GREEN)
		indicator.visible = value
	else:
		indicator.visible = false


func buy_cannon(loc:Vector3, collider:CollisionObject3D) -> void:
	
	if GameManager.get_cash() < GameManager.cannon_price:
		return
		
	var cannon = CANNON.instantiate()
	add_child(cannon)
	cannon.global_position = loc
	collider.remove_from_group("Empty")
	collider.add_to_group("Cannon 1")
	GameManager.add_cash(-GameManager.cannon_price)


func buy_blaster(loc:Vector3, collider:CollisionObject3D) -> void:
	
	if GameManager.get_cash() < GameManager.blaster_price:
		return
		
	var blaster = BLASTER.instantiate()
	add_child(blaster)
	blaster.global_position = loc
	collider.remove_from_group("Empty")
	collider.add_to_group("Blaster 1")
	GameManager.add_cash(-GameManager.blaster_price)


func wave_manager() -> void:
	if enemies_to_spawn > 0 and can_spawn:
		spawn_timer.start()
		var enemy = ENEMY.instantiate()
		enemy.scale = Vector3(0.5, 0.5, 0.5)
		path_3d.add_child(enemy)
		enemies_to_spawn -= 1
		can_spawn = false


func start_wave() -> void:
	spawn_timer.wait_time = GameManager.ufo_spawn_delay
	wave_timer.wait_time = GameManager.ufo_wave_delay
	
	enemies_to_spawn = GameManager.ufo_wave_size
	GameManager.add_wave(1)
	wave_timer.start()
	
	
func _on_spawn_timer_timeout() -> void:
	can_spawn = true


func _on_wave_timer_timeout() -> void:
	can_spawn = true
	start_wave()


func on_cannon_button_pressed():
	in_build_menu = false
	buy_cannon(indicator.global_position, collider)


func on_blaster_button_pressed():
	in_build_menu = false
	buy_blaster(indicator.global_position, collider)

