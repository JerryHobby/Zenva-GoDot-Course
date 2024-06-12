extends Unit


@onready var selection_visual = $SelectionVisual




func _ready():
	super._ready()
	selection_visual.hide()
	pass


func toggle_selected_visual(_show:bool):
	selection_visual.visible = _show

