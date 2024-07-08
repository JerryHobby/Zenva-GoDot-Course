extends Area2D

func _on_body_entered(body):
	if  GameManager.get_keys() < 1:
		return
	if GameManager.get_enemy_count() > 0:
		return
	
	if body.is_in_group("Player"):
		Sfx.next()
		GameManager.next_level()

