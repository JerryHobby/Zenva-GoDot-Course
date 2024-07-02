extends CharacterBody3D

@onready var speed:float = GameManager.ufo_speed
@onready var max_health:float = GameManager.ufo_max_health

@onready var path: PathFollow3D = $".."
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var hit = $Hit
@onready var cpu_particles_3d = $CPUParticles3D
@onready var healthbar = $HealthBar3D

var health:float
var dead:bool = false


func _ready():
	GameManager.add_enemies_alive(1)
	health = max_health
	healthbar.setup(max_health)
	hit.hide()


func _physics_process(delta: float) -> void:
	path.set_process(true)
	path.progress += speed * delta
	
	if path.progress_ratio >= 0.99:
		GameManager.add_health(GameManager.ufo_damage_to_player)
		GameManager.add_enemies_alive(-1)
		queue_free()
		#path.progress_ratio = 0
	
	move_and_slide()


func take_damage(object:String, damage:float) -> void:
	#print("%s hit for %0.2f damage" % [object, damage])
	health -= damage

	if health <= 0:
		die()
	else:
		healthbar.update(health)
		animation_player.play("hit")


func die() -> void:
	if dead:
		return
		
	dead = true
	GameManager.add_score(GameManager.ufo_score)
	GameManager.add_cash(GameManager.ufo_cash)
	GameManager.add_health(GameManager.ufo_healing_to_player)

	cpu_particles_3d.emitting = true
	GameManager.add_enemies_alive(-1)
	animation_player.play("die")
