extends NoiseGeneration
class_name NearestNoiseGeneration
@export var value_tile_pairs: Dictionary[int,Vector2i]
@export var snap = 0.1

# Called when the node enters the scene tree for the first time.
func generate(map: TileMapLayer, tilegen: TileGeneration,seed: int):
	noise.seed = seed
	for x in tilegen.map_size.x:
		for y in tilegen.map_size.y:
			var value: float = remap(noise.get_noise_2d(x,y),-1,1,0,1) 
			var int_value: int = round(remap(value,0,1,0,value_tile_pairs.size()-1))
			map.set_cell(Vector2i(x,y),1,value_tile_pairs[int_value])
