extends NoiseGeneration
class_name BorderNoiseGeneration
@export var border_value: float = 0.5
@export var wall_tile_cords: Vector2i = Vector2i(0,1)
@export var empty_tile_cords: Vector2i = Vector2i(0,0)


# Called when the node enters the scene tree for the first time.
func generate(map: TileMapLayer, tilegen: TileGeneration,seed: int):
	noise.seed = seed
	for x in tilegen.map_size.x:
		for y in tilegen.map_size.y:
			var value: float = remap(noise.get_noise_2d(x,y),-1,1,0,1) 
			if value > border_value:
				map.set_cell(Vector2i(x,y),1,wall_tile_cords)
			else:
				map.set_cell(Vector2i(x,y),1,empty_tile_cords)
