extends Sprite3D
@onready var bar = $SubViewport/HealthBar


# Called when the node enters the scene tree for the first time.
func _ready():
	texture = $SubViewport.get_texture()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func setup(value:int):
	bar.setup_bar(value)

func update(value:int):
	bar.update_bar(value)

