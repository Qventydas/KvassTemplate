extends GenerationProcedure
@export var player_scene: PackedScene
@export var empty_area_range: int = 5
@export var borders_safety: int = 4


# Called when the node enters the scene tree for the first time.
func generate(map: TileMapLayer,tilegen: TileGeneration, seed: int):
	var borders: Vector2 = map.tile_set.tile_size * tilegen.map_size
	var cords = Vector2(randi_range(0+ borders_safety,borders.x-borders_safety),randi_range(0+borders_safety,borders.y-borders_safety))
	var cells_to_erase: PackedVector2Array = TileHelper.get_cells_around_dot(map,empty_area_range,cords)
	var spawn = player_scene.instantiate()
	spawn.position = cords
	TileHelper.destroy_tiles(map,cells_to_erase)
	TileHelper.destroy_tiles(map,cells_to_erase)
	TileHelper.destroy_tiles(map,cells_to_erase)
	Global.current_level.call_deferred("create_entity",spawn)
	
