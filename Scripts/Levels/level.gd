extends Node
class_name Level
@export var object_groups: Dictionary[String,Node]

func _enter_tree() -> void:
	Global.current_level = self

func create_object(spawn: Node, group: String = "Objects"):
	if object_groups.has(group):
		object_groups[group].add_child(spawn)
	else:
		print("No such group:" + group)

func get_all_objects(key:String = "Objects") -> Array:
	return object_groups[key].get_children()
