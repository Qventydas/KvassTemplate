extends EntityData

@export var cooldown: float = 1
@export var projectile_scene: PackedScene

var beacon: Node2D
var timer: Timer
var ready_to_shoot: bool = true

signal simple_shot()

func _process(delta: float) -> void:
	aim(delta)
	if Input.is_action_pressed("shoot") and ready_to_shoot:
		shoot()

func shoot():
	var spawn = projectile_scene.instantiate()
	spawn.position += cached_owner.global_position
	spawn.rotation += cached_owner.global_rotation
	Global.current_level.create_entity(spawn)
	ready_to_shoot = false
	timer.start()
	simple_shot.emit()

func data_init():
	super.data_init()
	await get_tree().process_frame
	var new_beacon = Node2D.new()
	cached_owner.add_child(new_beacon)
	beacon = new_beacon
	var new_timer = Timer.new()
	new_timer.wait_time = cooldown
	new_timer.one_shot = true
	new_timer.connect("timeout",self.reload)
	add_child(new_timer)
	timer = new_timer

func reload():
	ready_to_shoot = true

func aim(delta: float):
	beacon.global_rotation = 0
	var mouse_pos: Vector2 = beacon.get_global_mouse_position()
	var target = beacon.get_angle_to(mouse_pos)
	cached_owner.global_rotation = lerp_angle(cached_owner.global_rotation,target,3*delta)
