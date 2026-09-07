extends GenerationProcedure
class_name BordersProcedure
@export var wall_tile_cords: Vector2i = Vector2i(0,1)

func generate(map: TileMapLayer,tilegen: TileGeneration,seed: int):
	var size: Vector2i = tilegen.map_size
	for x in range(size.x):
			map.set_cell(Vector2i(x,0),1,wall_tile_cords)
			map.set_cell(Vector2i(x,size.y),1,wall_tile_cords)
	for y in range(size.y):
		map.set_cell(Vector2i(0,y),1,wall_tile_cords)
		map.set_cell(Vector2i(size.x,y),1,wall_tile_cords)
