extends Node
var active_camera: Camera2D = null


func set_active_camera(new_camera: Camera2D) -> void:
	if active_camera:
		active_camera.enabled = false
	
	new_camera.enabled = true
	active_camera = new_camera
