extends Node
const SETTINGS_SECTION = "Settings"
const SETTINGS_FILE = "user://settings.cfg"

var current_settings: Dictionary = {
	"whatever" : 1,
	"meowmeow": 2
}

signal settings_edited(new_settings: Dictionary)

func _exit_tree() -> void:
	save_settings()

func _enter_tree() -> void:
	load_settings()

func get_setting(key: String) -> Variant:
	return current_settings.get(key, null)

func update_settings(new_settings: Dictionary):
	current_settings = new_settings
	settings_edited.emit(new_settings)

func save_settings():
	var file_path = SETTINGS_FILE
	var file = ConfigFile.new()
	file.set_value(SETTINGS_SECTION,"settings",current_settings)
	file.save(file_path)

func load_settings():
	if FileAccess.file_exists(SETTINGS_FILE):
		var file = ConfigFile.new()
		var err = file.load(SETTINGS_FILE)
		if err != OK:
			return
		var result: Dictionary = file.get_value(SETTINGS_SECTION,"settings")
		print(result)
		current_settings = result
