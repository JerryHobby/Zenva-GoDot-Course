extends WorldEnvironment

var time:float # 0.0 - 1.0 -- position in 24 hour period
@export var day_length:float = 60 # how many seconds to elapse 24 hours
@export var start_time:float = 0.3 # what time of day to begin
@export var sun_color:Gradient
@export var moon_color:Gradient
@export var sun_intensity:Curve
@export var moon_intensity:Curve

@export var sky_top_color:Gradient
@export var sky_horizon_color:Gradient

var time_rate:float


@onready var sun = $Sun
@onready var moon = $Moon
@onready var sky = $"."


# Called when the node enters the scene tree for the first time.
func _ready():
	time_rate = 1.0 / day_length
	time = start_time
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += time_rate * delta
	if time >= 1:
		time = 0
	
	sun.rotation_degrees.x = time * 360 + 90
	moon.rotation_degrees.x = time * 360 + 270
	
	sun.light_color = sun_color.sample(time)
	sun.light_energy = sun_intensity.sample(time)
	sun.visible = sun.light_energy > 0
	
	moon.light_color = moon_color.sample(time)
	moon.light_energy = moon_intensity.sample(time)
	moon.visible = moon.light_energy > 0

	sky.environment.sky.sky_material.set("sky_top_color", sky_top_color.sample(time))
	sky.environment.sky.sky_material.set("sky_horizon_color", sky_horizon_color.sample(time))
	sky.environment.sky.sky_material.set("ground_top_color", sky_top_color.sample(time))
	sky.environment.sky.sky_material.set("ground_horizon_color", sky_horizon_color.sample(time))
	
	
