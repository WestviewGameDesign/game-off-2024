extends Node


func _ready() -> void:
	EventBus.start_game.connect(_on_start_button_pressed)


func _on_start_button_pressed() -> void:
	$LevelManager.load_level(preload("res://scenes/levels/level.tscn"))
