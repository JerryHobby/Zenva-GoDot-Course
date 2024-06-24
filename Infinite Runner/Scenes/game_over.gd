extends CanvasLayer

@onready var score_label: Label = $ScoreLabel
@onready var gui: CanvasLayer = $"../GUI"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()

func game_over():
	gui.hide()
	show()
	score_label.text = "Final Score: %d" % GameManager.get_score()


func _on_button_pressed() -> void:
	GameManager.reset_game()
	get_tree().reload_current_scene()
