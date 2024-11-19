class_name RangeDisplay
extends Node

@export var target_label: Label
# The node this component is attached to.
var parent: Range
var label_format_text: String

func _ready() -> void:
	assert(get_parent() is Range, "Component RangeDisplay must be attached to a Range!")
	parent = get_parent() as Range
	label_format_text = target_label.text
	parent.value_changed.connect(_on_parent_value_changed)
	_on_parent_value_changed(parent.value)

func _process(_delta: float) -> void:
	pass


func _on_parent_value_changed(value: float) -> void:
	target_label.text = label_format_text % value
