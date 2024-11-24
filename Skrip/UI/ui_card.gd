class_name UICard
extends Control

signal permintaan_reparent(target_ui_card : UICard)
signal munculkan_konfirmasi(data_card: UICard)

@export var label_status : Label
@export var label_keterangan : Label
@export var latar_kartu : TextureRect
@export var path_latar_kartu : String
@export var area_deteksi : Area2D

@export var card_state_machine: CardStateMachine 
@export var indikator_status : ColorRect

@export var indikator_discard : ColorRect
var status_discard : bool = false:
	set(ganti):
		status_discard = ganti
		if ganti:
			indikator_discard.show()
		else:
			indikator_discard.hide()

@onready var status_deck : UIDeck.status_deck

var object_card : Card

func _ready() -> void:
	card_state_machine as CardStateMachine
	card_state_machine.custom_init(self)

func bebas_init(card : Card) -> void:
	object_card = card
	label_keterangan.text = object_card.tipe_card.keterangan_card
	latar_kartu.texture = load(object_card.tipe_card.aset_latar)
	
func on_input(event: InputEvent) -> void:
	card_state_machine.on_input(event)

func _on_gui_input(event: InputEvent):
	card_state_machine.on_gui_input(event)

func _on_mouse_entered():
	card_state_machine.on_mouse_entered()

func _on_mouse_exited():
	card_state_machine.on_mouse_exited()
