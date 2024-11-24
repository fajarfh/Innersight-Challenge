class_name BacaData
extends Node

signal koin_berubah(jumlah:int)

var alamat_data : String = "res://Skrip/Data/data.json"
var data_deck : Array[Deck]
var tipe_card : Dictionary
var data_koin : int:
	set(koin_baru):
		data_koin = koin_baru
		koin_berubah.emit(data_koin)

var deck_jualan : Deck

var semua_card : Array[Card]
var id_ : int = 0
	
func _init() -> void:
	if not FileAccess.file_exists(alamat_data):
		print("Data tidak ditemukan seharusnya: " + alamat_data)
	
	var load_file = FileAccess.open(alamat_data, FileAccess.READ)

	var json_string = load_file.get_as_text()

	var json = JSON.new()

	# Check if there is any error while parsing the JSON string, skip in case of failure.
	var hasil_parse = json.parse(json_string)
	if not hasil_parse == OK:
		print("JSON Parse Error: ", json.get_error_message(), " di ", json_string, " baris ke-", json.get_error_line())
		

	# Get the data from the JSON object.
	var tampung_data : Dictionary = json.data
	
	data_koin = tampung_data["Data Pemain"]["Koin"]
	
	for i:String in tampung_data["Daftar Deck"]:
		
		if tampung_data["Daftar Deck"][i]["Nama"] == "Deck Jualan":
			continue
		
		var deck_tambah = Deck.new(
			tampung_data["Daftar Deck"][i]["ID"],
			tampung_data["Daftar Deck"][i]["Nama"],
			tampung_data["Daftar Deck"][i]["Isi Deck"]
		)
		deck_tambah.name = deck_tambah.nama_deck
		data_deck.append(deck_tambah)
	
	
	#tipe_card = tampung_data["Tipe Card"]
	
	for i:String in tampung_data["Tipe Card"]:
		var tipe_tambah = CardTipe.new(
			tampung_data["Tipe Card"][i]["ID"],
			tampung_data["Tipe Card"][i]["Nama"],
			tampung_data["Tipe Card"][i]["Keterangan"],
			tampung_data["Tipe Card"][i]["Harga"],
			tampung_data["Tipe Card"][i]["Latar"],
		)
		tipe_tambah.name = tipe_tambah.nama_tipe
		tipe_card[i] = tipe_tambah
	
	#print(tipe_card)
	
	for j in data_deck:
		var idx_array = 0
		for k in j.daftar_card:
			var card_tambah = Card.new(id_,tipe_card[k])
			card_tambah.name = "Kartu No " + str(card_tambah.id_card)
			
			j.daftar_card[idx_array] = card_tambah
			#print(j.daftar_card[idx_array])
			semua_card.append(card_tambah)
			id_ += 1
			idx_array +=1
	#print(semua_card)
	deck_jualan = Deck.new(
			tampung_data["Daftar Deck"]["4"]["ID"],
			tampung_data["Daftar Deck"]["4"]["Nama"],
			tampung_data["Daftar Deck"]["4"]["Isi Deck"]
		)
	for m in range(0,deck_jualan.daftar_card.size()):
		var card_tambah = Card.new(id_,tipe_card[deck_jualan.daftar_card[m]])
		card_tambah.name = "Kartu No " + str(card_tambah.id_card)
		deck_jualan.daftar_card[m] = card_tambah
		semua_card.append(card_tambah)
	
	## potongan kode di bawah untuk menguji penyimpanan data
	# setelah diubah
	#node_data["Daftar Deck"]["1"]["Isi Kartu"].append("1")
	#node_data["Daftar Deck"]["1"]["Isi Kartu"].sort()
	#
	#print(node_data["Daftar Deck"]["1"]["Isi Kartu"])
	#
	#var save_file = FileAccess.open(alamat_data, FileAccess.WRITE)
	#
	#json_string = JSON.stringify(node_data, "\t")
	#save_file.store_line(json_string)
	
