extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HUDSystem.hud_root = self
	%ScoreTracker.text = str(GlobalVars.get_var("score"))
