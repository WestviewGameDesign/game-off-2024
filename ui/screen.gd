class_name Screen
extends Control


signal screen_requested(screen: StringName) 


func request_screen(screen: StringName) -> void:
	screen_requested.emit(screen)
	
