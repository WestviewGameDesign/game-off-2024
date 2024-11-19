class_name Settings
extends Resource

@export var music_volume: int:
	set(value):
		_set_volume(value, "Music")
		music_volume = value
		emit_changed()
		
@export var sfx_volume: int:
	set(value):
		_set_volume(value, "SFX")
		sfx_volume = value
		emit_changed()


func _set_volume(value: float, bus: StringName) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(bus), linear_to_db(value / 100))
