extends StatusCard



func masuk() -> void:
	if not ui_card.is_node_ready():
		await ui_card.ready
	
	ui_card.permintaan_reparent.emit(ui_card)
	ui_card.indikator_status.color = Color.TRANSPARENT
	ui_card.label_status.text = "DASAR"
	ui_card.pivot_offset = Vector2.ZERO
	
func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("klik_kiri"):
		
		if ui_card.status_deck != UIDeck.status_deck.NORMAL:
			ui_card.munculkan_konfirmasi.emit(ui_card)
		else:
			
			ui_card.pivot_offset = ui_card.get_global_mouse_position() - ui_card.global_position
			permintaan_pindah.emit(self, StatusCard.Status.KLIK)
	
