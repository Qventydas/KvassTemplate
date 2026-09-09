extends EntityData
@export var current_move: Vector2 = Vector2(0,0)
@export var polygon: Polygon2D
@export var left: bool = false
@export var speed: float = 7
var target_track_speed: float = 1
var current_track_speed: float = 1
var current_offset: float = 0


func _physics_process(delta: float) -> void:
	target_track_speed = current_move.x * speed
	if current_move.y != 0:
		if left:
			target_track_speed = current_move.y * -speed
		else:
			target_track_speed = current_move.y * speed
	#print(str(current_move) + ":" + str(target_track_speed))
	current_offset += current_track_speed * delta
	current_track_speed = lerp(current_track_speed,target_track_speed,3*delta)
	polygon.material.set('shader_parameter/offset_x',current_offset)

func handle_direction(vector: Vector2):
	current_move = vector
	
