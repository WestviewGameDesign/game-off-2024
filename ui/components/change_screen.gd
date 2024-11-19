class_name ChangeScreen
extends Node


@export var screen: StringName
# The node this component is attached to.
var parent: BaseButton


func _ready() -> void:
	assert(get_parent() is BaseButton, "Component ChangeScreen must be attached to a BaseButton!")
	parent = get_parent() as BaseButton
	parent.pressed.connect(_on_parent_pressed)


func _process(_delta: float) -> void:
	pass


func _on_parent_pressed() -> void:
	if parent.is_visible_in_tree():
		if owner is Screen:
			owner.request_screen(screen)
		else:
			push_warning("Tried to switch screen but not in a screen scene!")
