extends Node
#class_name GlobalVars

const GLOBAL_CONSTANTS = {
	"USER_FOLDER" : "user://",
	"SETTINGS_FILE" : "user://settings.cfg"
}

var global_vars = {
	"score" : 0
}


func get_var(key: String) -> Variant:
	return global_vars[key]

func set_var(key: String, value) -> void:
	global_vars[key] = value

func increase_var(key: String, value) -> void:
	global_vars[key] = global_vars[key] + value
