extends AudioStreamPlayer3D

@export var footstep_sounds:Array[AudioStream]
@export var play_rate:float = 0.5
@export var min_velocity:float = 0.5
var last_played_time:float

@onready var player = $".."


func _process(delta):
	if not player.is_on_floor():
		return
	
	if player.velocity.length() < min_velocity:
		return

	if Time.get_unix_time_from_system() - last_played_time < play_rate:
		return
	
	last_played_time = Time.get_unix_time_from_system()
	stream = footstep_sounds.pick_random()
	play()
	
