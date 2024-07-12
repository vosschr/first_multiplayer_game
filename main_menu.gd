extends Control

@onready var game_scene = preload("res://game.tscn")


func _on_host_button_button_down():
	Lobby.become_host()
	get_tree().change_scene_to_packed(game_scene)


func _on_join_button_button_down():
	Lobby.join_as_player_2()
	get_tree().change_scene_to_packed(game_scene)
