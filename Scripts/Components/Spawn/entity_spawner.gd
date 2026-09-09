extends EntityData

@export var scenes_to_spawn: Array[PackedScene]
@export var group: String = "Things"

func handle_body_collide(body: Node2D,cords: Vector2):
	create_entity(scenes_to_spawn.pick_random(),cords,group)

func handle_cord_spawn(cords: Vector2):
	create_entity(scenes_to_spawn.pick_random(),cords,group)
