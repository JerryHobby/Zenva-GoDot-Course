extends Node

const COIN = preload("res://Scenes/coin.tscn")

func spawn_coin():
	var coin = COIN.instantiate()
	
	add_child(coin)
	coin.global_position = Vector2(573, 218)
