extends Node
class_name EntityDataContainer
@export var EntityDatas: Dictionary[String,EntityData] = {}


func get_data(key: String) -> EntityData:
	if key in EntityDatas.keys():
		return EntityDatas[key]
	else:
		return null

func _ready() -> void:
	for child in get_children():
		EntityDatas[child.name] = child
		child.data_init()
