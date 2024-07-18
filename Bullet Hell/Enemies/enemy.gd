extends CharacterBody2D
@onready var sprite_2d:Sprite2D = $Sprite2D
@onready var shoot_timer = $ShootTimer
@onready var bullet_spawn_point = $BulletSpawnPoint
@onready var bullets = $Bullets
@onready var health_bar = $HealthBar
@onready var player = $"../../Player"

enum Monsters { CYCLOPS, ELF, DRYAD, GNOLL, SERPENT, IRONHEART, SPRIGGAN }

@export var monster:Monsters = Monsters.CYCLOPS
@export var shoot_speed:float = 3.0
@export var shoot_range:float = 175.0
@export var sight_range:float = 200.0
@export var move_speed:float = 20.0
@export var health:int = 100
@export var bullet_speed:float = 200

var _current_health = health
var is_alive:bool = true


var _facing_direction:Vector2 = Vector2.DOWN # Looking downward


var monster_skin:Array = []


func _ready():
	_load_skins()
	setup_monster(monster)
	shoot_timer.start(shoot_speed)


func _physics_process(delta):
	
	if not is_alive:
		return
	
	var move_dir:Vector2 = (player.global_position - global_position).normalized()
	_facing_direction = face_direction(move_dir)
	
	if global_position.distance_to(player.global_position) < sight_range:
		move(move_dir, delta)


func face_direction(dir:Vector2) -> Vector2:
	var new_dir:Vector2 = _facing_direction
	
	if dir.x > 0:
		new_dir = Vector2.RIGHT
		sprite_2d.flip_h = true
		
	elif dir.x < 0:
		new_dir = Vector2.LEFT
		sprite_2d.flip_h = false
		
	elif dir.y < 0:
		new_dir = Vector2.UP
		sprite_2d.flip_h = true

	elif dir.y > 0:
		new_dir = Vector2.DOWN
		sprite_2d.flip_h = true
	
	return new_dir


func move(dir:Vector2, _delta):
	velocity = dir * move_speed
	move_and_slide()



func _load_skins():
	monster_skin.resize(Monsters.size())
	monster_skin[Monsters.CYCLOPS] = "res://Assets/monster sprites/cyclops_new.png"
	monster_skin[Monsters.ELF] = "res://Assets/monster sprites/deep_elf_annihilator.png"
	monster_skin[Monsters.DRYAD] = "res://Assets/monster sprites/dryad.png"
	monster_skin[Monsters.GNOLL] = "res://Assets/monster sprites/gnoll_sergeant.png"
	monster_skin[Monsters.SERPENT] = "res://Assets/monster sprites/guardian_serpent_old.png"
	monster_skin[Monsters.IRONHEART] = "res://Assets/monster sprites/ironheart_preserver.png"
	monster_skin[Monsters.SPRIGGAN] = "res://Assets/monster sprites/spriggan_enchanter.png"


func _on_shoot_timer_timeout():
	var dir = global_position.direction_to(player.global_position)
	shoot(dir)


func setup_monster(
	new_monster:Monsters, 
	new_shoot_speed:float = shoot_speed, 
	new_move_speed:float = move_speed):

	sprite_2d.texture = load(monster_skin[new_monster])
	shoot_speed = new_shoot_speed
	move_speed = new_move_speed
	
	_current_health = health
	health_bar.value = _current_health


func shoot(dir:Vector2):
	shoot_timer.start(shoot_speed)
	if global_position.distance_to(player.global_position) > shoot_range:
		return
		
	bullet_spawn_point.position = _facing_direction * 15
	var bullet = bullets.get_bullet()
	bullet.global_position = bullet_spawn_point.global_position
	bullet.shoot(dir, bullet_speed)




func die():
	is_alive = false


func take_damage(amount:int):
	_current_health -= amount
	
	if _current_health < 0:
		_current_health = 0
		health_bar.value = _current_health
		die()
	else:
		health_bar.value = _current_health


func heal(amount:int):
	_current_health += amount
	if _current_health > health:
		_current_health = health
	health_bar.value = _current_health
