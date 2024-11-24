extends Node2D

@export var deck_beli : UIDeck
@export var deck_jual : UIDeck
@export var panel_konfirmasi: PanelContainer
@export var label_koin : Label

var jumlah_koin : int:
	set(koin):
		jumlah_koin = koin
		label_koin.text = str(jumlah_koin)
	get:
		return BacaDataNode.data_koin



@onready var ui_card_res : = preload("res://Skena/UI/ui_card.tscn")
var card_proses : UICard

func _ready():
	
	deck_beli.bebas_init(BacaDataNode.deck_jualan, UIDeck.status_deck.BELI)
	deck_beli.teruskan_konfirmasi.connect(munculkan_panel)
	deck_jual.bebas_init(BacaDataNode.data_deck[2], UIDeck.status_deck.JUAL)
	deck_jual.teruskan_konfirmasi.connect(munculkan_panel)
	#jumlah_koin = BacaDataNode.data_koin
	label_koin.text = str(jumlah_koin)
	BacaDataNode.koin_berubah.connect(set_koin)

func set_koin(koin_baru:int) -> void:
	jumlah_koin = koin_baru
	
func munculkan_panel(ui_card:UICard) -> void:
	panel_konfirmasi.show()
	panel_konfirmasi.pratinjau_kartu.texture = load(ui_card.object_card.tipe_card.aset_latar)
	
	if ui_card.status_deck == UIDeck.status_deck.JUAL:
		panel_konfirmasi.judul_panel.text = "Konfirmasi Penjualan"
		panel_konfirmasi.harga.text = "Harga Jual:"
		panel_konfirmasi.nilai_harga.text = str(ui_card.object_card.tipe_card.jual_card)
		panel_konfirmasi.tombol_beli.hide()
		panel_konfirmasi.tombol_jual.show()
	elif ui_card.status_deck == UIDeck.status_deck.BELI:
		panel_konfirmasi.judul_panel.text = "Konfirmasi Pembelian"
		panel_konfirmasi.harga.text = "Harga Beli:"
		panel_konfirmasi.nilai_harga.text = str(ui_card.object_card.tipe_card.harga_card)
		panel_konfirmasi.tombol_beli.show()
		panel_konfirmasi.tombol_jual.hide()
		
	panel_konfirmasi.keterangan.text = ui_card.object_card.tipe_card.keterangan_card
	
	card_proses = ui_card
	


func _on_tombol_beli_button_up():
	panel_konfirmasi.hide()
	BacaDataNode.data_koin -= card_proses.object_card.tipe_card.harga_card
	beli_card_process(card_proses)


func _on_tombol_jual_button_up():
	panel_konfirmasi.hide()
	BacaDataNode.data_koin += card_proses.object_card.tipe_card.jual_card
	jual_card_process(card_proses)


func _on_batal_button_up():
	panel_konfirmasi.hide()
	card_proses = null
	
func jual_card_process(card:UICard):
	
	BacaDataNode.semua_card.erase(card.object_card)
	deck_jual.deck_identity.daftar_card.erase(card.object_card)
	deck_jual.ui_card_paket.erase(card)
	card.queue_free()
	card_proses = null
	
func beli_card_process(card:UICard):
	var card_tambah = Card.new(BacaDataNode.semua_card.size(), card.object_card.tipe_card)
	card_tambah.name = "Kartu No " + str(card_tambah.id_card)
	BacaDataNode.semua_card.append(card_tambah)
	deck_jual.deck_identity.daftar_card.append(card_tambah)
	
	var tambah_ui_card = ui_card_res.instantiate()
	deck_jual.ui_card_paket.append(tambah_ui_card)
	tambah_ui_card.name = "ui_card_"+str(deck_jual.ui_card_paket.size())
	tambah_ui_card.bebas_init(card_tambah)
	
	deck_jual.area_isi.add_child(tambah_ui_card)
	deck_jual.area_isi.move_child(tambah_ui_card,0)
	tambah_ui_card.status_deck = deck_jual.status_deck_ini
	tambah_ui_card.munculkan_konfirmasi.connect(deck_jual._on_permintaan_munculkan)


func _on_tombol_kembali_button_up():
	get_tree().change_scene_to_file("res://Skena/skena_utama.tscn")
