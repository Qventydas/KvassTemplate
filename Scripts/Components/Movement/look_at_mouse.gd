extends EntityData


# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	var targ: Vector2 = cached_owner.get_global_mouse_position()
	var cords: Vector2 = cached_owner.global_position
	var targ_angle = cords.angle_to_point(targ)
	cached_owner.global_rotation = lerp_angle(cached_owner.global_rotation,targ_angle,0.3)
