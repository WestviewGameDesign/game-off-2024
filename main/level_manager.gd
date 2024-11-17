class_name LevelManager
extends Node

var level_name: StringName:
	get:
		if level_node:
			return level_node.name
		else:
			return &"None"
	set(value):
		load_level(value)
var level_node: Node


func load_level(level) -> void:
	if level_node:
		level_node.queue_free()
	
	level_node = level.instantiate()
	add_child(level_node)