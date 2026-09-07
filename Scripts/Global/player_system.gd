extends Node

@export var current_player: Node = null


func set_player(new_player):
	current_player = new_player

func get_player() -> Node:
	return current_player
