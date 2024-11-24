class_name Deck
extends Node

var daftar_card : Array
var id_deck : int
var nama_deck : String

func _init(id : int, nama : String, daftar: Array) -> void:
	
	id_deck = id
	nama_deck = nama
	daftar_card = daftar
	
	#for i in daftar:
		
		#daftar_card.append()
	
	
	

	
	#tampung_data = json.parse()
	
	#id_deck = tampung_data[nama]["ID"]
	#daftar_kartu = tampung_data[nama]["Isi Kartu"]
	
