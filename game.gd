extends Control

var player_choices = {}
var chose_already = false

func _on_rock_button_button_down():
	send_choice_to_server("rock")


func _on_paper_button_button_down():
	send_choice_to_server("paper")


func _on_scissors_button_button_down():
	send_choice_to_server("scissors")


@rpc("any_peer", "call_local", "reliable", 0)
func send_choice_to_server(choice: String):
	if chose_already:
		return
	chose_already = true
	player_choices[str(multiplayer.get_unique_id())] = choice
	if len(player_choices) == 2:
		for key in player_choices:
			var value = player_choices[key]
			print("Player " + key + " chose " + value)
	chose_already = false
