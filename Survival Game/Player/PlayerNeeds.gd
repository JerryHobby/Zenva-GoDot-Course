extends Node2D

@onready var health = $Health
@onready var hunger = $Hunger
@onready var thirst = $Thirst
@onready var sleep = $Sleep

@export var no_hunger_health_decay:float
@export var no_thirst_health_decay:float


# Called when the node enters the scene tree for the first time.
func _ready():
	
	health.value = health.start_value
	hunger.value = hunger.start_value
	thirst.value = thirst.start_value
	sleep.value = sleep.start_value



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	hunger.subtract(hunger.decay_rate * delta)
	thirst.subtract(thirst.decay_rate * delta)
	sleep.add(sleep.regen_rate * delta)

	if hunger.value == 0:
		health.subtract(no_hunger_health_decay * delta)

	if thirst.value == 0:
		health.subtract(no_thirst_health_decay * delta)

	if health.value == 0:
		print("Die")

	if Input.is_action_just_pressed("jump"):
		eat(5)
		drink(5)
		rest(100)

	health.update_bar()
	hunger.update_bar()
	thirst.update_bar()
	sleep.update_bar()


func eat(amount):
	hunger.add(amount)
	hunger.update_bar()


func drink(amount):
	thirst.add(amount)
	thirst.update_bar()


func rest(amount):
	sleep.subtract(amount)
	sleep.update_bar()


