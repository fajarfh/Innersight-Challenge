class_name CardStateMachine
extends Node

@export var status_awal : StatusCard

var status_ini : StatusCard
var daftar_status :={}

func custom_init(card:UICard) -> void:
	for child in get_children():
		if child is StatusCard:
			daftar_status[child.status] = child
			child.permintaan_pindah.connect(_on_perpindahan_diminta)
			child.ui_card = card
	
	if status_awal:
		status_awal.masuk()
		status_ini = status_awal

func on_input(event: InputEvent) -> void:
	if status_ini:
		status_ini.on_input(event)

func on_gui_input(event: InputEvent) -> void:
	if status_ini:
		status_ini.on_gui_input(event)

func on_mouse_entered() -> void:
	if status_ini:
		status_ini.on_mouse_entered()
	
func on_mouse_exited() -> void:
	if status_ini:
		status_ini.on_mouse_exited()

func _on_perpindahan_diminta(dari: StatusCard, ke: StatusCard.Status) -> void:
	if dari != status_ini:
		return
	
	var status_baru: StatusCard = daftar_status[ke]
	if not status_baru:
		return
	
	if status_ini:
		status_ini.keluar()
	
	status_baru.masuk()
	status_ini = status_baru
	
		
		
	
