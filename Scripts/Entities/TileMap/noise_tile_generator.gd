extends EntityData
@export var noise: FastNoiseLite
@export var border_value: float = 0
@export var x_size: int = 256
@export var y_size: int = 256
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	noise.seed = randi()
	generate()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func generate():
	#var noise: Noise = noise_texture.noise
	var map: TileMapLayer = get_data_owner()
	for x in x_size:
		for y in y_size:
			var value: float = remap(noise.get_noise_2d(x,y),-1,1,0,1) 
			if value > border_value:
				map.set_cell(Vector2i(x,y),1,Vector2i(1,0))
