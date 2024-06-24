extends Node


const BLOCK_SIZE = 40
const GAP_SIZE = BLOCK_SIZE * 1
const MIN_BLOCKS = 2
const MAX_BLOCKS = 4

const PLATFORM:PackedScene = preload("res://Scenes/platform.tscn")
var pool_size:int = 30

var platform_pool:Array [Platform] = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(pool_size):
		var platform = create_platform()
		
		platform.platform_size = 1
		platform.position = Vector2i(BLOCK_SIZE * platform.platform_size * i + GAP_SIZE, 200)
		platform.set_platform()
		
		platform.show()




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var cnt = 0
	for platform in platform_pool:
		cnt += 1
		if platform.position.x < -MAX_BLOCKS * BLOCK_SIZE:
			reset_platform(platform)
			add_plaform()



func create_platform() -> Platform:
	
	for platform in platform_pool:
		if not platform.visible:
			return platform
	
	var platform = PLATFORM.instantiate()
	add_child(platform)
	platform_pool.append(platform)
	
	reset_platform(platform)
	return platform



func reset_platform(platform:Platform) -> void:
	platform.global_position = Vector2(-1000, -1000)
	platform.hide()


func add_plaform() -> void:
	
	for platform in platform_pool:
		if not platform.visible:
			var pos:int
			pos = platform_pool.find(platform)
	
			platform.show()
			platform.platform_size = randi_range(MIN_BLOCKS, MAX_BLOCKS)
			
			platform.position.y = randi_range(BLOCK_SIZE * 3, BLOCK_SIZE * 5)
			
			var spawn_pos_x:float = 0
			var platform_index:int
			
			if pos > 0:
				platform_index = pos - 1
			else:
				platform_index = pool_size - 1
			
			var platform_size:int = platform_pool[platform_index].platform_size * BLOCK_SIZE
			var prev_block_pos_x:int = int(platform_pool[platform_index].global_position.x)
			
			spawn_pos_x = prev_block_pos_x
			spawn_pos_x += platform_size
			spawn_pos_x += GAP_SIZE + randi_range(-GAP_SIZE, 0)
			
			platform.position.x = spawn_pos_x

			platform.set_platform()
			platform.add_coins()
			
