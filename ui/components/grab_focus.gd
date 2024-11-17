class_name GrabFocus
extends Node

# The node this component is attached to.
var parent: Control


func _ready() -> void:
	assert(get_parent() is Control, "Component GrabFocus must be attached to a Control!")
	parent = get_parent() as Control
	parent.visibility_changed.connect(_on_parent_visibility_changed)
	_on_parent_visibility_changed()


func _process(_delta: float) -> void:
	pass


func _on_parent_visibility_changed() -> void:
	if parent.is_visible_in_tree():
		parent.grab_focus.call_deferred()
