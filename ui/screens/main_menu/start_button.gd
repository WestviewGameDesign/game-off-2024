extends Button


func _pressed() -> void:
	EventBus.start_game.emit()