extends TileMap

class_name Platform

var platform_size:int = 10

const COIN = preload("res://Scenes/coin.tscn")


func set_platform() -> void:
	clear()
	for i in range(platform_size):
		set_cell(0, Vector2i(i, 0), 0, Vector2i(0,0), 0)


func _physics_process(delta: float) -> void:
	position.x -= GameManager.get_speed() * delta


func add_coins() -> void:
	for i in range(1, platform_size-1):
		var coin_temp = COIN.instantiate()
		coin_temp.position = map_to_local(Vector2i(i, 0)) + Vector2(0, -100)
		add_child(coin_temp)
		
