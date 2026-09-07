extends Node2D
@export var x_size: int = 4
@export var y_size: int = 4
@export var step: int = 16
@export var scene_to_spawn: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	do_spawn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func do_spawn():
	var level: Level = Global.current_level
	for x in x_size:
		for y in y_size:
			var spawn = scene_to_spawn.instantiate()
			spawn.position = Vector2(x*step,y*step)
			level.create_entity(spawn)
