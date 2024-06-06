extends Area2D
@onready var animation_player = $AnimationPlayer


func _on_body_entered(body):
	animation_player.play("spin")
	body.scale += Vector2(0.2, 0.2)


func _on_animation_player_animation_finished(anim_name):
	print("DEAD COIN")
	queue_free()
