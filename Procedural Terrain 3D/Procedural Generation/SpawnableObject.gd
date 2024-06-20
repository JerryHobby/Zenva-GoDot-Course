extends Node

class_name SpawnableObject

@export var scenes_to_spawn:Array[PackedScene] = []
@export var spawn_count:int = 1
@export var min_scale:float = 1.0
@export var max_scale:float = 1.0

@export var min_elevation:float = 0 # sea level
@export var max_elevation:float = 1000.0
