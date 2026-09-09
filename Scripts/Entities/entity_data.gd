extends Node
class_name EntityData
var cached_owner: Node

func get_data_owner() -> Node:
	return get_parent().get_parent()

func get_container() -> Node:
	return get_parent()

func data_init():
	cached_owner = get_data_owner()
	#EntityManager.update_comp_owner(self,get_container())

func create_entity(scene: PackedScene, cords: Vector2,group: String = "Things"):
	var spawn: Node = scene.instantiate()
	spawn.position = cords
	Global.current_level.create_entity(spawn,group)
