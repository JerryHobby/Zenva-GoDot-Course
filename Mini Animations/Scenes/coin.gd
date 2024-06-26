extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D

var sprites:Array[Texture] = [
	preload("res://Assets/MiniProject/Coins/Coin1.png"),
	preload("res://Assets/MiniProject/Coins/Coin2.png"),
	preload("res://Assets/MiniProject/Coins/Coin3.png"),
	preload("res://Assets/MiniProject/Coins/Coin4.png") ]

var max_sprites:int = sprites.size()
var cur_sprite:int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cur_sprite = randi_range(0, max_sprites - 1)
	sparkles(false)
	rand_sprite()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func rand_sprite() -> void:
		sprite_2d.texture = sprites[cur_sprite]

		if cur_sprite == max_sprites - 1:
			cur_sprite = 0
		else:
			cur_sprite += 1


func sparkles(onoff:bool):
	cpu_particles_2d.emitting = onoff


func _on_body_entered(_body: Node2D) -> void:
	cpu_particles_2d.emitting = false

	animation_player.play("hit")
