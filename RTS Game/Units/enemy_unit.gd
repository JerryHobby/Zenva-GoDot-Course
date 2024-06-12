extends Unit

@export var detect_range:float = 200


func _process(delta):
	super._process(delta)

	if target == null:
		for player in game_manager.players:
			if player == null:
				continue
			
			var distance = global_position.distance_to(player.global_position)

			if distance <= detect_range:
				set_target(player)
	
