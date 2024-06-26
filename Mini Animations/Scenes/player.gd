extends RigidBody2D

@export var can_jump:bool = true
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var mini_project: Node = $".."
@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and can_jump:
		animation_player.play("jump")


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("TileMapLayer"):
		animation_player.play("idle")


func spawn_coin():
	mini_project.spawn_coin()
	

func spash_dirt():
	cpu_particles_2d.emitting = true
