extends CharacterBody2D

signal on_player_moved

@onready var animation_player = $AnimationPlayer

func _physics_process(_delta):
	player_input()


func player_input() -> void:
	velocity = Vector2.ZERO
	
	if Input.is_action_just_pressed("move_right"):
		velocity += Vector2.RIGHT
		move(velocity)
	if Input.is_action_just_pressed("move_left"):
		velocity += Vector2.LEFT
		move(velocity)
	if Input.is_action_just_pressed("move_up"):
		velocity += Vector2.UP
		move(velocity)
	if Input.is_action_just_pressed("move_down"):
		velocity += Vector2.DOWN
		move(velocity)
		
	if Input.is_action_just_pressed("attack_right"):
		try_attack(Vector2.RIGHT)
	if Input.is_action_just_pressed("attack_left"):
		try_attack(Vector2.LEFT)
	if Input.is_action_just_pressed("attack_up"):
		try_attack(Vector2.UP)
	if Input.is_action_just_pressed("attack_down"):
		try_attack(Vector2.DOWN)


func move(direction:Vector2) -> void:
	var ray_length = Vector2(GameManager.tile_size, GameManager.tile_size)
	var space_rid = get_world_2d().space
	var space_state = PhysicsServer2D.space_get_direct_state(space_rid)
	var query = PhysicsRayQueryParameters2D.create(global_position, global_position + ray_length * direction)
	var result = space_state.intersect_ray(query)

	if result:
		if result.collider.is_in_group("Wall"):
			return
		if result.collider.is_in_group("Enemy"):
			return
	
	Sfx.walk()
	position += GameManager.tile_size * direction
	on_player_moved.emit()


func try_attack(direction:Vector2) -> void:
	var ray_length = Vector2(GameManager.tile_size, GameManager.tile_size)
	var space_rid = get_world_2d().space
	var space_state = PhysicsServer2D.space_get_direct_state(space_rid)
	var query = PhysicsRayQueryParameters2D.create(global_position, global_position + ray_length * direction)
	var result = space_state.intersect_ray(query)

	if result:
		if result.collider.is_in_group("Enemy"):
			result.collider.take_damage(GameManager.damage_dealt)


func take_damage(damage_taken:int) -> void:
	GameManager.update_health(-damage_taken)

	if GameManager.get_health() <= 0:
		die()
	else:
		Sfx.hit()
		animation_player.play("hit")


func die() -> void:
	Sfx.death()
	animation_player.stop()
	animation_player.play("player die")


func restart() -> void:
	const GAME_OVER = preload("res://Scenes/game_over.tscn")
	get_tree().change_scene_to_packed(GAME_OVER)
	queue_free()
