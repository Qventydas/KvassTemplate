extends EntityData
@export var ray_cast: RayCast2D
@export var visual_line: Line2D
@export var cells_range = 2


signal thing_collide(body: PhysicsBody2D,cords: Vector2)
signal cells_collide(map: TileMapLayer, cells: Array[Vector2i], cords: Vector2)
signal no_collide(cords: Vector2)

func data_init():
	super.data_init()
	ray_cast.force_raycast_update()
	if ray_cast.is_colliding():
		var body = ray_cast.get_collider()
		var cords: Vector2 = ray_cast.get_collision_point()
		var offset: Vector2 = cached_owner.global_position - cords
		visual_line.points = [Vector2(0,0),Vector2(offset.length(),0)]
		if body is TileMapLayer:
			var collide = TileHelper.get_cells_around_dot(body,cells_range,cords)
			cells_collide.emit(body,collide)
			thing_collide.emit(body,cords)
	else:
		visual_line.points = [Vector2(0,0),ray_cast.target_position]
		var cords: Vector2 = Vector2().from_angle(cached_owner.rotation) * ray_cast.target_position.x
		no_collide.emit(cords + cached_owner.global_position)
