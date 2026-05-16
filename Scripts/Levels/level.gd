extends Node
class_name Level
@export var entity_groups: Dictionary[String,Node]

func _enter_tree() -> void:
	Global.current_level = self

func create_entity(spawn: Node, group: String = "Things"):
	if entity_groups.has(group):
		entity_groups[group].add_child(spawn)
	else:
		print("No such group:" + group)

func get_all_entities(key:String = "Things") -> Array:
	return entity_groups[key].get_children()
