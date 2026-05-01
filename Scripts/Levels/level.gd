extends Node
class_name Level

# Called when the node enters the scene tree for the first time.
func _enter_tree() -> void:
	Global.current_level = self
