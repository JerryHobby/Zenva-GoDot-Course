extends Panel

@onready var audio_window = $"."
@onready var master_slider = $"VBoxContainer/Master Volume/HSlider"
@onready var music_slider = $"VBoxContainer/Music Volume/HSlider"
@onready var sfx_slider = $"VBoxContainer/SFX Volume/HSlider"

var master_index:int
var music_index:int
var sfx_index:int

func _ready():
	master_index = AudioServer.get_bus_index("Master")
	music_index = AudioServer.get_bus_index("Music")
	sfx_index = AudioServer.get_bus_index("SFX")
	audio_window.visible = false
	
	master_slider.value = _get_volume(master_index)
	music_slider.value = _get_volume(music_index)
	sfx_slider.value = _get_volume(sfx_index)


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		audio_window.visible = not audio_window.visible
		
		if audio_window.visible:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _get_volume(bus_index:int) -> float:
	var db_volume = AudioServer.get_bus_volume_db(bus_index)
	return db_to_linear(db_volume)


func _set_volume(bus_index:int, volume:float):
	var db_volume = linear_to_db(volume)
	AudioServer.set_bus_volume_db(bus_index, db_volume)


func _on_master_slider_value_changed(value):
	_set_volume(master_index, value) # Replace with function body.


func _on_music_slider_value_changed(value):
	_set_volume(music_index, value) # Replace with function body.


func _on_sfx_slider_value_changed(value):
	_set_volume(sfx_index, value) # Replace with function body.
