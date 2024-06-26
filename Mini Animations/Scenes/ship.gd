extends Sprite2D

@export var is_moving:bool = false
var is_moving_state:bool = is_moving

@onready var animation_player_bullets: AnimationPlayer = %"AnimationPlayer Bullets"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if is_moving_state and not is_moving:
		print("stopped")

	if not is_moving_state and is_moving:
		print("started")
	
	is_moving_state = is_moving


func shoot():
	animation_player_bullets.play("shoot")
	print("... shooting")
