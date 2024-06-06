extends Sprite2D
@onready var animation_player = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.speed_scale = randf_range(.1, .7)

