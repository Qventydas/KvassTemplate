extends EntityData


# Called when the node enters the scene tree for the first time.
func erase_tiles(map: TileMapLayer,tiles: Array[Vector2i]):
	TileHelper.destroy_tiles(map,tiles)
