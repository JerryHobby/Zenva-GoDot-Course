extends Area2D


@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_audio_stream_player_2d_finished() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		GameManager.add_score(1)
		GameManager.increase_speed(1)
		sprite_2d.hide()
		audio_stream_player_2d.play()
