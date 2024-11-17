class_name Save
extends RefCounted

const settings_path := "user://settings.tres"
const default_settings := preload("res://core/save_system/default_settings.tres")
static var settings: Settings


static func _static_init() -> void:
	if not FileAccess.file_exists(settings_path):
		settings = default_settings.duplicate()
		_on_settings_changed()
	else:
		settings = SafeResourceLoader.load(settings_path)
		assert(settings is Settings, "Could not load settings file!")
		if settings is not Settings:
			settings = default_settings
			#TODO: We should probably notify the player if this happens
	settings.changed.connect(_on_settings_changed)


static func _on_settings_changed() -> void:
	#TODO: Should proably use a backup to prevent corruption
	# Maybe make a safe_load and safe_save method so it can be generalized to
	# other save files besides settings
	ResourceSaver.save(settings, settings_path)
