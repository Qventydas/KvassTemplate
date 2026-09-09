extends ColorRect


func _process(delta: float) -> void:
	if CameraSystem.active_camera != null:
		var cam = CameraSystem.active_camera
		var screen: Vector2i = get_window().size
		size = screen #* cam.zoom
