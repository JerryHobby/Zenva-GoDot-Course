extends CanvasLayer
@onready var game_over_label = $GameOverLabel

@onready var score_label = $ScoreLabel
@onready var waves_label = $WavesLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	score_label.text = "Score: %d" % GameManager.get_score()
	waves_label.text = "Waves: %d" % GameManager.get_wave()


func _on_button_pressed():
	GameManager.reset()
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

