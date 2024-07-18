extends Node

@export var bullet_scene:PackedScene
var pool_size:int = 2

var bullet_pool:Array = []

func new_bullet() -> Node:
		var bullet_temp:Node = bullet_scene.instantiate()
		bullet_temp.hide()
		bullet_temp.global_position = Vector2(-1000, -1000)
		bullet_pool.append(bullet_temp)
		add_child(bullet_temp)
		return(bullet_temp)
	
	
func get_bullet() -> Node:
	for bullet in bullet_pool:
		if not bullet.visible:
			return bullet
	return new_bullet()


func reset_bullet(bullet:Node) -> void:
	bullet.global_position = Vector2(-1000, -1000)
	bullet.hide()
	
