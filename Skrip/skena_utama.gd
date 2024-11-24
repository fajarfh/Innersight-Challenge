extends Node2D





func _on_challenge_1_uji_deck_button_up():
	get_tree().change_scene_to_file("res://Skena/uji_deck.tscn")


func _on_challenge_2_uji_toko_button_up():
	get_tree().change_scene_to_file("res://Skena/uji_toko.tscn")


func _on_challenge_3_uji_discard_button_up():
	get_tree().change_scene_to_file("res://Skena/uji_buang.tscn")
