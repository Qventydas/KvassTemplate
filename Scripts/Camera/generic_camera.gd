extends Camera2D
@export var start_camera: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if start_camera:
		CameraSystem.set_active_camera(self)
