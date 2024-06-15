extends ProgressBar

@export var need_name:String = "Need Label"
@export var color:Color = Color.RED

@onready var need_label = $NeedLabel


func set_bar_color(color):
	var sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill", sb)
	sb.bg_color = color


func update_value(new_value:float, max:float):
	max_value = max
	value = new_value

	need_label.text = "%s: %d / %d" % [need_name, value, max_value]
	set_bar_color(color)

	#var value_pct = new_value / max
	#
	#if value_pct > .6:
		#set_bar_color(color)
	#elif value_pct > .3:
		#set_bar_color(Color.ORANGE)
	#else:
		#set_bar_color(Color.RED)
