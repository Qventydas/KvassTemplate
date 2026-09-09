extends EntityData
enum MOVEMENT_TYPES {
	TOPDOWNBASE,
	TANK,
	RELATIVETOPDOWN,
	HOTLINE,
	PLATFORMER
}
@export var movement_type: MOVEMENT_TYPES
@export var linear_speed: float = 1
@export var angular_speed: float = 1
@export var lerp_speed: float = 2
@export var aiming: bool = false
var target_velocity: Vector2 = Vector2.ZERO

signal move_data(direction: Vector2)

func _physics_process(delta: float) -> void:
	var cur_owner: Node = get_data_owner()
	var direction = Input.get_vector("up","down","left","right")
	var axis = Input.get_axis("backward","forward")
	var rot_axis = Input.get_axis("left","right")
	match movement_type:
		MOVEMENT_TYPES.TOPDOWNBASE:
			target_velocity = direction * linear_speed
		MOVEMENT_TYPES.TANK:
			cur_owner.rotation += rot_axis * angular_speed * delta
			target_velocity = Vector2(cos(cur_owner.rotation),sin(cur_owner.rotation)) * linear_speed * axis
		MOVEMENT_TYPES.RELATIVETOPDOWN:
			target_velocity = Vector2(axis,rot_axis) * linear_speed
			target_velocity = target_velocity.rotated(cached_owner.rotation)
			aim_cursor()
		MOVEMENT_TYPES.HOTLINE:
			target_velocity = direction * linear_speed
			aim_cursor()
	lerp_velocity(cur_owner,delta)
	cur_owner.move_and_slide()
	move_data.emit(direction)

func lerp_velocity(owner: Node,delta: float):
	owner.velocity = lerp(owner.velocity,target_velocity,lerp_speed * delta)

func aim_cursor():
	var targ: Vector2 = cached_owner.get_global_mouse_position()
	var cords: Vector2 = cached_owner.position
	var targ_angle = cords.angle_to_point(targ)
	print(targ, cords,targ_angle)
	cached_owner.rotation = lerp_angle(cached_owner.rotation,targ_angle,0.3)
