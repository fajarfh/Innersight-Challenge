extends Node2D

@export var deck : UIDeck
@export var panel : PanelContainer

var card_proses : UICard

func _ready() ->void:
	deck.bebas_init(BacaDataNode.data_deck[1], UIDeck.status_deck.UJI_BUANG)
	deck.teruskan_konfirmasi.connect(munculkan_panel)

func _on_tombol_kembali_button_up() -> void:
	get_tree().change_scene_to_file("res://Skena/skena_utama.tscn")

func munculkan_panel(ui_card:UICard) -> void:
	if ui_card.status_deck == UIDeck.status_deck.UJI_BUANG:
		panel.show()
		card_proses = ui_card
		
	if ui_card.status_discard:
		panel.tombol_cabut.show()
		panel.tombol_discard.hide()
		panel.keterangan.text = "Cabut discard kartu?"
	else:
		panel.tombol_cabut.hide()
		panel.tombol_discard.show()
		panel.keterangan.text = "Lanjut discard kartu?"


func _on_tombol_discard_button_up():
	card_proses.status_discard = true
	deck.area_isi.move_child(card_proses,deck.area_isi.get_child_count())
	panel.hide()
	card_proses = null


func _on_tombol_cabut_button_up():
	card_proses.status_discard = false
	panel.hide()
	card_proses = null


func _on_batal_button_up():
	panel.hide()
