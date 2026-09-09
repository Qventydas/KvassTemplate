extends EntityData
class_name TileGeneration
@export var procedures: Array[GenerationProcedure] = []
@export var map_size: Vector2i = Vector2i(256,256)
@export var active: bool = true

func data_init():
	super.data_init()
	if cached_owner is TileMapLayer and active:
		var seed: int = randi()
		for procedure in procedures:
			procedure.generate(cached_owner,self,seed)
