class_name SettingsControl
extends Node

const SIGNALS := {
	&"Range": &"value_changed",
	&"OptionButton": &"item_selected",
	&"BaseButton": &"toggled",
	&"ColorPickerButton": &"color_changed"
}

const PROPERTIES := {
	&"Range": &"value",
	&"OptionButton": &"selected",
	&"BaseButton": &"button_pressed",
	&"ColorPickerButton": &"color"
}

@export var setting: StringName

# The node this component is attached to.
var parent: Control
var parent_type := &""

func _ready() -> void:
	assert(get_parent() is Control, "Component SettingsControl must be attached to a Control!")
	parent = get_parent() as Control
	for type in SIGNALS:
		if parent.is_class(type):
			parent_type = type
	assert(parent_type != &"", "Component SettingsControl not implemented for type %s!" % parent_type)
	parent.connect(SIGNALS[parent_type], _on_parent_setting_changed)
	
	parent.set(PROPERTIES[parent_type], Save.settings.get(setting))

func _on_parent_setting_changed(_value) -> void:
	Save.settings.set(setting, parent.get(PROPERTIES[parent_type]))
