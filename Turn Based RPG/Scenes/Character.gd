extends Node2D
class_name Character

@export var is_player:bool = true
@export var max_hp:int = 25
@export var current_hp:int = 25

@export var combat_actions:Array
@export var opponent:Node

@export var sprite_texture:Texture2D
@export var flipped:bool = false

@onready var animation_player = $AnimationPlayer

@onready var health_text = $HealthBar/HealthText
@onready var health_bar = $HealthBar

@onready var battle_scene = $".."

var my_turn:bool = false

var damage_actions:Array
var healing_actions:Array
	

# Called when the node enters the scene tree for the first time.
func _ready():
	
	battle_scene.character_begin_turn.connect(on_char_begin_turn)
	battle_scene.character_end_turn.connect(on_char_end_turn)
	
	health_bar.max_value = max_hp
	_update_health_bar()
	
	$Sprite2D.texture = sprite_texture
	$Sprite2D.flip_h = flipped
	
	# sort actions into healing or damage. can be both
	for i in combat_actions:
		var action = i as CombatAction
		if action.damage > 0:
			damage_actions.append(action)
		if action.heal > 0:
			healing_actions.append(action)
		


func _update_health_bar():
	health_text.text = str(current_hp, " / ", max_hp)
	health_bar.value = current_hp


func take_damage(amount:int):
	current_hp -= amount
	if current_hp <= 0:
		current_hp = 0
		
	_update_health_bar()
	animation_player.play("damage")
	
	if current_hp == 0:
		die()


func heal(amount:int):
	current_hp += amount

	if current_hp > max_hp:
		current_hp = max_hp
	
	_update_health_bar()


func die():
	animation_player.play("die")
	await get_tree().create_timer(0.5).timeout
	battle_scene.character_died(self)
	queue_free()


func on_char_begin_turn(character):
	if character != self:
		return
	my_turn = true

	if not character.is_player:
		decide_combat_action()


func on_char_end_turn(character):
	if character != self:
		return
	my_turn = false



func cast_combat_action(action):

	print(action.display_name)
	if action.damage > 0:
		opponent.take_damage(action.damage)
	if action.heal > 0:
		heal(action.heal)
	battle_scene.end_current_turn()


func decide_combat_action():
	
	# on healing action, choose

	
	var health_percent:float = float(current_hp) / float(max_hp)

	# choose actions at random
	var healing_action = healing_actions[randi_range(0, len(healing_actions) - 1)]
	var damage_action = damage_actions[randi_range(0, len(damage_actions) - 1)]
	
	# chance to heal
	if randf() > health_percent + 0.2:
		cast_combat_action(healing_action)
	else:
		cast_combat_action(damage_action)

