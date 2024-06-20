extends Node

class_name TerrainGeneration

var mesh:MeshInstance3D

var size_depth:float = 300
var size_width:float = 300
var mesh_resolution:int = 2
var max_height:float = 70.0

@export var noise:FastNoiseLite
@export var elevation_curve:Curve

var falloff_image:Image
var use_falloff:bool = true

@onready var water: MeshInstance3D = $Water
@export var water_level:float = 0.2


@onready var nav_region: NavigationRegion3D = $NavigationRegion3D

@onready var rng:RandomNumberGenerator = RandomNumberGenerator.new()
var spawnable_objects:Array[SpawnableObject] = []



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	for i in get_children():
		if i is SpawnableObject:
			spawnable_objects.append(i)
	
	noise.seed = randi()
	noise.seed = 1
	
	rng.seed = noise.seed
	
	var fall_off_texture = preload("res://Procedural Generation/Textures/TerrainFalloff.png")
	falloff_image = fall_off_texture.get_image()
	
	_generate()


func _generate():
	var plane_mesh = PlaneMesh.new()
	
	
	plane_mesh.size = Vector2(size_width, size_depth)
	plane_mesh.subdivide_depth = size_depth * mesh_resolution
	plane_mesh.subdivide_width = size_width * mesh_resolution
	plane_mesh.material = preload("res://Procedural Generation/Materials/TerrainMaterial.tres")
	
	var surface = SurfaceTool.new()
	var data = MeshDataTool.new()
	
	surface.create_from(plane_mesh, 0)
	
	var array_plane = surface.commit()
	data.create_from_surface(array_plane, 0)
	
	for i in range(data.get_vertex_count()):
		var vertex = data.get_vertex(i)
		vertex.y = get_noise_y(vertex.x, vertex.z)
		data.set_vertex(i, vertex)
	
	array_plane.clear_surfaces()
	data.commit_to_surface(array_plane)
	surface.begin(Mesh.PRIMITIVE_TRIANGLES)
	surface.create_from(array_plane, 0)
	surface.generate_normals()
	
	
	mesh = MeshInstance3D.new()
	mesh.mesh = surface.commit()
	mesh.create_trimesh_collision()
	mesh.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	mesh.add_to_group("NavSource")
	add_child(mesh)
	
	water.position.y = water_level * max_height
	
	for i in spawnable_objects:
		spawn_objects(i)
		
	nav_region.bake_navigation_mesh()
	await nav_region.bake_finished
	


func get_noise_y (x, z) -> float:
	# get the noise value based on the given coordinates
	var value = noise.get_noise_2d(x, z)
	
	# the noise gives us a range of -1.0 to 1.0
	# we want to remap that to a range of 0.0 to 1.0
	var remapped_value = (value + 1) / 2
	
	# sample the elevation curve to adjust that value
	var adjusted_value = elevation_curve.sample(remapped_value)
	
	# convert our X and Z to a range of 0.0 to 1.0
	var x_percent = (x + (size_width / 2)) / size_width
	var z_percent = (z + (size_depth / 2)) / size_depth
	
	# find the X and Y pixel for the coordinate on the falloff texture
	var x_pixel = int(x_percent * (falloff_image.get_width() - 1))
	var y_pixel = int(z_percent * (falloff_image.get_height() - 1))
	
	# sample the falloff texture
	var falloff = falloff_image.get_pixel(x_pixel, y_pixel).r
	
	# if we're not using falloff, set that value to 0
	if not use_falloff:
		falloff = 1.0
	
	return adjusted_value * max_height * falloff


func get_random_position(min_elevation:float, max_elevation:float) -> Vector3:
	var x = rng.randf_range( -size_width / 2, size_width / 2)
	var z = rng.randf_range( -size_depth / 2, size_depth / 2)
	var y = get_noise_y(x, z)
	
	if y < min_elevation or y > max_elevation:
		return get_random_position(min_elevation, max_elevation)
	return Vector3(x, y, z)


func spawn_objects(spawnable:SpawnableObject):
	for i in range(spawnable.spawn_count):
		var scene_index = rng.randi() % spawnable.scenes_to_spawn.size()
		var obj = spawnable.scenes_to_spawn[scene_index].instantiate()
		
		var min_elevation = spawnable.min_elevation + water.position.y
		var max_elevation = spawnable.max_elevation + water.position.y
		
		obj.add_to_group("NavSource")
		add_child(obj)
		obj.position = get_random_position(min_elevation, max_elevation)
		obj.scale = Vector3.ONE * rng.randf_range(spawnable.min_scale, spawnable.max_scale)
		obj.rotation_degrees.y = rng.randf_range(0, 360)
	
