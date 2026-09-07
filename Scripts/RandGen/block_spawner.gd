extends Node2D
@export var noise: NoiseTexture2D
@export var scene = preload("res://Resources/Scenes/RandGen/RandDummy.tscn")
@export var noise_offset: Vector2 = Vector2(0,0)
@export var border_value: float = 0
@export var step = 16

func _ready() -> void:
	noise_offset = Vector2(position / step)
	await get_tree().process_frame
	call_deferred("generate")
func generate() -> void:
	var level = Global.current_level
	var spawn = scene.instantiate()
	spawn.position = position
	var value: float = noise.noise.get_noise_2d(noise_offset.x,noise_offset.y)
	print(value)
	if value > border_value:
		level.create_entity(spawn)
