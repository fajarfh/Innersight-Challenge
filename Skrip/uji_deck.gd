extends Node2D
@export var tombol_buka : Button
@export var tombol_tutup : Button
@export var area_deck : MarginContainer

@onready var ui_deck : = preload("res://Skena/UI/ui_deck.tscn")

func _on_tombol_buka_button_up()-> void:
	tombol_buka.hide()
	tombol_tutup.show()
	
	var node_deck_baru = ui_deck.instantiate()
	node_deck_baru.bebas_init(BacaDataNode.data_deck.pick_random())
	area_deck.add_child(node_deck_baru)


func _on_tombol_tutup_button_up()-> void:
	tombol_tutup.hide()
	tombol_buka.show()
	
	if area_deck.get_child_count()>0:
		for i in area_deck.get_children():
			i.queue_free()


func _on_tombol_kembali_button_up():
	get_tree().change_scene_to_file("res://Skena/skena_utama.tscn")
