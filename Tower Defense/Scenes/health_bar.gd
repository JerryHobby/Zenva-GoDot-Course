extends ProgressBar

func setup_bar(amount:int) -> void:
	max_value = amount
	value = amount

func update_bar(amount:int) -> void:
	value = amount

