extends Node3D

enum CoinColors {GOLD, BRONZE, SILVER = -1}
@export var coin_color: CoinColors
@export var award_points:int = 10


@onready var coin_gold = $Coin/CoinGold
@onready var coin_bronze = $Coin/CoinBronze
@onready var coin_silver = $Coin/CoinSilver

var die:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	coin_silver.hide()
	
	match coin_color:
		CoinColors.GOLD:
			coin_gold.show()
		CoinColors.BRONZE:
			coin_bronze.show()
		_:
			coin_silver.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if die:
		queue_free()
		return


func _on_coin_body_entered(body):
	if body.is_in_group("Player"):
		body.add_score(award_points)
		die = true
