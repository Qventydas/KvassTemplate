class_name TileHelper

static func get_cells_around_dot(map: TileMapLayer, range: int,position: Vector2) -> PackedVector2Array:
	var result_tiles: PackedVector2Array
	var tile_size = map.tile_set.tile_size
	#var center_offset = floor(range/2)
	#var global_offset = round(Vector2i(position) / tile_size) 
	#for x in range:
		#for y in range:
			#var pos = Vector2i(x,y)
			#if pos.length() <= range:
				#result_tiles.append(pos - Vector2i(center_offset,center_offset) + global_offset)
	var global_offset = round(Vector2i(position) / tile_size)
	var center_offset = round(range/2)
	for x in range(-center_offset,center_offset):
		for y in range(-center_offset,center_offset):
			var pos = Vector2i(x,y)
			if pos.length() <= range/2:
				result_tiles.append(pos + global_offset)
	return result_tiles

static func get_nearest_cell(map: TileMapLayer,position: Vector2) -> Vector2i:
	var tile_size: Vector2i = map.tile_set.tile_size
	return round(Vector2i(position) / tile_size)

static func erase_cells(map:TileMapLayer, cells_to_erase: Array[Vector2i]):
	for cord in cells_to_erase:
		map.erase_cell(cord)

static func set_cells(map:TileMapLayer, cells_to_set: Array[Vector2i],
atlas_cords: Vector2i = Vector2i(0,0),
source: int = 1):
	for cord in cells_to_set:
		map.set_cell(cord,source,atlas_cords)

static func destroy_tiles(map:TileMapLayer, cells_to_destroy: Array[Vector2i]):
	for cell in cells_to_destroy:
		var tile_data: TileData = map.get_cell_tile_data(cell)
		if tile_data == null:
			continue
		if tile_data.get_custom_data("destroyable") == true:
			map.set_cell(cell,1,tile_data.get_custom_data("tile_after_destroy"))
