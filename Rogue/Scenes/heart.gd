extends Area2D

func _on_body_entered(body):
	if body.is_in_group("Player"):
		Sfx.heart()
		GameManager.update_health(GameManager.health_per_heart)
		GameManager.update_heart_count(-1)
		queue_free()
