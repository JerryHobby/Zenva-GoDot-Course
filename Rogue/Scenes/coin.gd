extends Area2D

func _on_body_entered(body):
	if body.is_in_group("Player"):
		Sfx.coin()
		GameManager.update_coins(GameManager.coins_per_coin)
		GameManager.update_coin_count(-1)
		queue_free()
