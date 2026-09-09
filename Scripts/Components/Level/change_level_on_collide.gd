extends EntityData
@export_file_path(".tscn") var target_scene_path: String

# Called when the node enters the scene tree for the first time.
func collide_handle(body: Node):
	if body == PlayerSystem.current_player:
		get_tree().change_scene_to_file(target_scene_path)
		GlobalVars.increase_var("score",1)
