extends CharacterBody2D

class_name Enemy

@onready var player = get_tree().get_nodes_in_group("Player")[0]
var health:int = GameManager.enemy_heatlh
var damage_dealt:int = GameManager.enemy_damage_dealt
var attack_chance:float = GameManager.enemy_attack_chance
@onready var animation_player = $AnimationPlayer

func move() -> void:
	if randf() < 0.5:
		return

	var direction = Vector2.ZERO
	var can_move:bool = false

	while not can_move:
		direction = get_random_direction()

		var ray_length = Vector2(GameManager.tile_size, GameManager.tile_size)
		var space_rid = get_world_2d().space
		var space_state = PhysicsServer2D.space_get_direct_state(space_rid)
		var query = PhysicsRayQueryParameters2D.create(global_position, global_position + ray_length * direction)
		var result = space_state.intersect_ray(query)
		
		if not result and position + GameManager.tile_size * direction != player.position:
			can_move = true
			
	position += GameManager.tile_size * direction


func get_random_direction() -> Vector2:
	var directions:Array = [Vector2.ZERO, Vector2.UP, Vector2.DOWN, Vector2.LEFT, Vector2.RIGHT]
	return directions.pick_random()


func take_damage(damage_taken:int) -> void:
	health -= damage_taken
	Sfx.hit()
	if health <= 0:
		die()
	else:
		animation_player.play("take damage")
		
		
	# hit back
	if randf() > attack_chance:
		player.take_damage(damage_dealt)


func die() -> void:
	GameManager.update_enemy_count(-1)
	animation_player.play("die")
	await animation_player.animation_finished
