extends EntityData
@export var tile_range = 5
#@export var area_shape: Shape2D

func tilemap_collide(map: TileMapLayer):
	var collided_tiles = TileHelper.get_cells_around_dot(map,tile_range,get_data_owner().position)
	for pos in collided_tiles:
		var tile_data: TileData = map.get_cell_tile_data(pos)
		map.erase_cell(pos)
