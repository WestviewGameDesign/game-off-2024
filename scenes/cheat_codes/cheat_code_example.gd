extends CheatCode

@export var icon: Sprite2D

func _on_cheat_code_activated() -> void:
	get_tree().create_tween().tween_property(icon, ^"rotation", icon.rotation + 2*PI, 1.0)
	print("cheat code activated!")
