extends CheatCode

@export var character: Character

func _on_cheat_code_activated() -> void:
	character.position += Vector2.UP * 100
