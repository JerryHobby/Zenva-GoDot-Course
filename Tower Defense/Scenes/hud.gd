extends CanvasLayer
@onready var wave_label = $MC/VbLeft/WaveLabel
@onready var score_label = $MC/VbLeft/ScoreLabel
@onready var health_label = $MC/VbRight/HealthLabel
@onready var cash_label = $MC/VbRight/CashLabel
@onready var enemies_label = $MC/VbLeft/EnemiesLabel
@onready var cannon_button = $Shop/CannonButton
@onready var blaster_button = $Shop/BlasterButton



func _ready():
	GameManager.on_score_update.connect(on_score_update)
	GameManager.on_cash_update.connect(on_cash_update)
	GameManager.on_health_update.connect(on_health_update)
	GameManager.on_wave_update.connect(on_wave_update)
	GameManager.on_enemies_alive_update.connect(on_enemies_alive_update)
	
	on_score_update(GameManager.get_score())
	on_cash_update(GameManager.get_cash())
	on_health_update(GameManager.get_health())
	on_wave_update(GameManager.get_wave())
	on_enemies_alive_update(GameManager.get_enemies_alive())

	cannon_button.text = "%d" % GameManager.cannon_price
	blaster_button.text = "%d" % GameManager.blaster_price


func on_score_update(value:int):
	score_label.text = "Score: %d" % value


func on_cash_update(value:int):
	cash_label.text = "Cash: %d" % value


func on_health_update(value:int):
	health_label.text = "Health: %d" % value


func on_wave_update(value:int):
	wave_label.text = "Wave: %d" % value


func on_enemies_alive_update(value:int):
	enemies_label.text = "UFOs: %d" % value


func _on_cannon_button_pressed():
	var world = $".."
	world.on_cannon_button_pressed()

	pass # Replace with function body.


func _on_blaster_button_pressed():
	var world = $".."
	world.on_blaster_button_pressed()
