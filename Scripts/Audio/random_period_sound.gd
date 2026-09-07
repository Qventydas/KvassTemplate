extends AudioStreamPlayer
@export var min_time: float = 5
@export var max_time: float = 30

func _ready() -> void:
	new_cycle()

func new_cycle() -> void:
	$Timer.wait_time = randf_range(min_time,max_time)
	$Timer.start()
