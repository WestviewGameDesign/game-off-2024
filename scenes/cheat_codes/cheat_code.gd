class_name CheatCode
extends Node

## A list of keys that need to be entered in order to activate the cheatcode.
## Should match the strings returned by event.as_text().to_lower() [br]
## Ex: "a", "space", "up"
@export var code: PackedStringArray

var current_code: Array


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed(): 
		current_code.push_back(event.as_text().to_lower())
		if len(current_code) > len(code):
			current_code.pop_front()
		
		if current_code == Array(code):
			_on_cheat_code_activated()
		

## Override this method to define what happens when teh cheatcode is activated
func _on_cheat_code_activated() -> void:
	pass
