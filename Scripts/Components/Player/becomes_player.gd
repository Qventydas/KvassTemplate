extends EntityData


# Called when the node enters the scene tree for the first time.
func data_init():
	super.data_init()
	PlayerSystem.set_player(cached_owner)
