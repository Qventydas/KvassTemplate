extends Node
class_name EntityData

# Called when the node enters the scene tree for the first time.
func get_data_owner() -> Node:
	return get_parent().get_parent()

func get_container() -> Node:
	return get_parent()
