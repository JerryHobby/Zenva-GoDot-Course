extends CharacterBody2D
@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_accept"):
		global_position.y -= 100
	
	if not is_on_floor():
		velocity.y = 200
		
	var collision = move_and_collide(velocity * delta)
	
	if collision and collision.get_travel().y > 0.0001:
		cpu_particles_2d.emitting = true
		print("I collided with ", collision.get_collider().name)
		print("travel: ", collision.get_travel())
	
