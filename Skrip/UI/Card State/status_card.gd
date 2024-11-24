class_name StatusCard
extends Node

enum Status {DASAR, KLIK, TAHAN, LEPAS}

signal permintaan_pindah(dari: StatusCard, ke: Status)

@export var status : Status
var ui_card : UICard

func masuk() -> void:
	pass
	
func keluar() -> void:
	pass

func on_input(_event:InputEvent) -> void:
	pass
	
func on_gui_input(_event:InputEvent) -> void:
	pass

func on_mouse_entered() -> void:
	pass
	
func on_mouse_exited() -> void:
	pass
	
