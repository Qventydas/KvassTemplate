extends Node
class_name EntityDataContainer
@export var EntityDatas: Dictionary[String,EntityData] = {}
@export var main_node: Node

func get_data(key: String) -> EntityData:
	if key in EntityDatas.keys():
		return EntityDatas[key]
	else:
		return null

func _ready() -> void:
	main_node = get_parent()
	EntityManager.add_entity(self)
	for child in get_children():
		EntityDatas[child.name] = child
		child.data_init()
