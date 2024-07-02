extends CharacterBody3D

var target:CharacterBody3D
var bullet_damage:int

var damage:Damage

func _ready():
	damage = Damage.new()
	damage.title = "Cannon Ball"
	damage.min_damage = GameManager.cannon_bullet_damage * 0.8
	damage.max_damage = GameManager.cannon_bullet_damage * 1.2
	damage.type = Damage.DamageType.PHYSICAL



func _physics_process(_delta: float) -> void:
	if is_instance_valid(target):
		velocity = global_position.direction_to(target.global_position) 
		velocity *= GameManager.cannon_bullet_speed
		
		look_at(target.global_position)
		
		move_and_slide()
	else:
		queue_free()



func _on_collision_body_entered(body: Node3D) -> void:
	if body.is_in_group("Enemy"):
		damage.min_damage = GameManager.cannon_bullet_damage * 0.8
		damage.max_damage = GameManager.cannon_bullet_damage * 1.2
		
		body.take_damage(
			damage.title,
			randf_range(damage.min_damage, damage.max_damage))
		queue_free()
