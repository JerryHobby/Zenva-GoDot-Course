extends StaticBody3D

@onready var bullet_damage:int = GameManager.cannon_bullet_damage

var current_targets:Array = []
var curr:CharacterBody3D

@onready var shoot_timer: Timer = $ShootTimer
@onready var bullet_container: Node = $BulletContainer

var can_shoot:bool = true

const BULLET = preload("res://Towers/bullet.tscn")
@onready var aim: Marker3D = $MeshInstance3D/Aim



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shoot_timer.wait_time = GameManager.cannon_shoot_timer



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	_shoot()


func _shoot():
	var target = _choose_target()
	if target:
		look_at(target.global_position)

	if not can_shoot:
		return
		
	
	if target == null:
		return
	
	var bullet = BULLET.instantiate()
	bullet_container.add_child(bullet)
	bullet.target = target
	bullet.bullet_damage = bullet_damage
	bullet.global_position = aim.global_position
	can_shoot = false
	shoot_timer.start()



func _choose_target() -> CharacterBody3D:
	var closest:CharacterBody3D = null
	
	if current_targets.size() == 0:
		return closest

	for target in current_targets:
		if closest == null:
			closest = target
			
		if target.get_parent().progress > closest.get_parent().progress:
				closest = target

	return closest


func _on_mob_detector_body_entered(body: Node3D) -> void:
	if not body.is_in_group("Enemy"):
		return
	current_targets.append(body)

func _on_mob_detector_body_exited(body: Node3D) -> void:
	if not body.is_in_group("Enemy"):
		return
		
	current_targets.erase(body)


func _on_shoot_timer_timeout() -> void:
	can_shoot = true # Replace with function body.
