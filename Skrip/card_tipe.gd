class_name CardTipe
extends Node

var id_tipe : int
var nama_tipe : String
var keterangan_card : String
var harga_card : int
var jual_card : int:
	get:
		return int(harga_card * 0.5)
		
var aset_latar : String

func _init(id:int, nama:String, keterangan: String, harga:int, latar:String) -> void:
	id_tipe = id
	nama_tipe = nama
	keterangan_card = keterangan
	harga_card = harga
	aset_latar = latar
