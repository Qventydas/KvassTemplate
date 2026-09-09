extends Node

var entities: Dictionary[int,EntityDataContainer] = {}
#var comp_owners: Dictionary[String,Array] = {}
var current_entity_count: int = 0

func add_entity(new_entity: EntityDataContainer):
	entities[current_entity_count] = new_entity
	current_entity_count += 1


func get_entities() -> Array[EntityDataContainer]:
	return entities.values()
