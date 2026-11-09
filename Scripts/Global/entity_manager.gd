extends Node

var entities: Dictionary[int,EntityDataContainer] = {}
var current_entity_count: int = 0

var pools: Dictionary[StringName, Array] = {}

func get_pool(key: StringName) -> Array:
	if not pools.has(key):
		pools[key] = []
	return pools[key]

func register_data(data: EntityData):
	var pool := get_pool(data.name)
	pool.append(data)

func add_entity(new_entity: EntityDataContainer):
	entities[current_entity_count] = new_entity
	new_entity.uid = current_entity_count
	current_entity_count += 1

func get_entities() -> Array[EntityDataContainer]:
	return entities.values()
