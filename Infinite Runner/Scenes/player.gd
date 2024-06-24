extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var dead_sprite: Sprite2D = $DeadSprite
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var game_over: CanvasLayer = $"../GameOver"

func _ready() -> void:
		animated_sprite_2d.show()
		dead_sprite.hide()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = GameManager.JUMP_VELOCITY
		animation_player.play("spin")

	is_dead()

	move_and_slide()


func is_dead() -> bool:
	if global_position.x < 20 or global_position.y > 225:
		animated_sprite_2d.hide()
		dead_sprite.show()
		game_over.game_over()

		#get_tree().paused = true
		return true
	return false
