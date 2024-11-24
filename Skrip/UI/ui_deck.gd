class_name UIDeck
extends Control

@export var area_isi : HBoxContainer

@onready var ui_card

var ui_card_paket : Array[UICard]
var deck_identity : Deck

enum status_deck {NORMAL, JUAL, BELI, UJI_BUANG}

var status_deck_ini : status_deck = status_deck.NORMAL

signal teruskan_konfirmasi(card: UICard)

func _init():
	ui_card = preload("res://Skena/UI/ui_card.tscn")

func bebas_init(deck : Deck, _status : status_deck = status_deck.NORMAL) -> void:
	#print(self.get_path())
	ui_card_paket = []
	deck_identity = deck
	status_deck_ini = _status
	
	for i in range(0,deck_identity.daftar_card.size()):
		#print(ui_card)
		var tambah_card : UICard = ui_card.instantiate()
		tambah_card.name = "ui_card_"+str(i)
		
		ui_card_paket.append(tambah_card)
		
		tambah_card.bebas_init(deck_identity.daftar_card[i])
		area_isi.add_child(tambah_card)
		tambah_card.status_deck = status_deck_ini
		tambah_card.munculkan_konfirmasi.connect(_on_permintaan_munculkan)
		
	#ambil_data.baca()
	#print(ambil_data)	
func _on_permintaan_munculkan(ui_card_kiriman: UICard) -> void:
	teruskan_konfirmasi.emit(ui_card_kiriman)	
	#var cobain = Deck.new("Deck A")
	#print(cobain.daftar_kartu)
