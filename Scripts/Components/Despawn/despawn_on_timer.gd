extends EntityData
@export var time: float = 1

# Called when the node enters the scene tree for the first time.
func data_init():
	super.data_init()
	var timer: Timer = Timer.new()
	timer.wait_time = time
	timer.autostart = true
	timer.connect("timeout",self.despawn)
	add_child(timer)

func despawn():
	cached_owner.queue_free()
