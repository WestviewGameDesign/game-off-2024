class_name UI
extends CanvasLayer

signal screen_changed(screen: StringName)

@export var screen_name: StringName

var screens: Array[Screen]

func _ready() -> void:
	# Array.assign() copies the array and casts its members 
	screens.assign($Screens.get_children())
	for screen in screens:
		screen.screen_requested.connect(set_screen)


func set_screen(screen: StringName) -> void:
	for child in $Screens.get_children():
		if child.name == screen:
			child.show()
		else:
			child.hide()
	screen_name = screen
	screen_changed.emit(screen)
