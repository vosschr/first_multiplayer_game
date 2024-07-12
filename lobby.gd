extends Node

var SERVER_PORT = 7000
var SERVER_IP = "127.0.0.1"  # localhost


func become_host():
	# create a server that is also a client
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(SERVER_PORT)
	multiplayer.multiplayer_peer = peer
	
	multiplayer.peer_connected.connect(_add_player_to_game)
	multiplayer.peer_disconnected.connect(_del_player)


func join_as_player_2():
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(SERVER_IP, SERVER_PORT)
	multiplayer.multiplayer_peer = peer


func _add_player_to_game(id: int):
	print("Player %s joined the game!" % id)


func _del_player(id: int):
	print("Player %s left the game!" % id)
