extends Node
class_name EntityData
var cached_owner: Node
#var data_owner = get_data_owner()
# Called when the node enters the scene tree for the first time.
func get_data_owner() -> Node:
	return get_parent().get_parent()

func get_container() -> Node:
	return get_parent()

func data_init():
	cached_owner = get_data_owner()
