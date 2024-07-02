extends MeshInstance3D
@onready var bar = $HealthBar3D


# Called when the node enters the scene tree for the first time.
func _ready():
	bar.setup(GameManager.get_health())
	GameManager.on_health_update.connect(on_health_update)


func on_health_update(value:int):
	bar.update(value)
	
