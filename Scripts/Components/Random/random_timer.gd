extends EntityData
class_name RandomTimer
@export var min_time:float = 1
@export var max_time:float = 2
@export var propability: float = 0.5
@export var refresh_time: bool = false

var timer: Timer = null
signal timeout()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = Timer.new()
	timer.wait_time = randf_range(min_time,max_time)
	timer.one_shot = false
	add_child(timer)
	timer.start()
	timer.connect("timeout",on_timeout)

func on_timeout():
	if !timer:
		return
	if randf() <= propability:
		timeout.emit()
		print("meow")
	else:
		print("no meow")
	if refresh_time:
		timer.wait_time = randf_range(min_time,max_time)
		
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
