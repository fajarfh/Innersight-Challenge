extends StatusCard

func masuk() -> void:
	var lapis_kartu := get_tree().get_first_node_in_group("lapis_kartu")
	
	if lapis_kartu:
		ui_card.reparent(lapis_kartu)
	
	ui_card.indikator_status.color = Color.GOLD
	ui_card.label_status.text = "TAHAN"
	ui_card.area_deteksi.monitoring = true

func on_input(event: InputEvent) -> void:
	var gerak_tetikus := event is InputEventMouseMotion
	var batal := event.is_action_pressed("klik_kanan")
	var konfirmasi := event.is_action_released("klik_kiri") or event.is_action_pressed("klik_kiri")
	
	if gerak_tetikus:
		ui_card.pivot_offset = ui_card.get_global_mouse_position() - ui_card.global_position
		
	if batal:
		permintaan_pindah.emit(self, StatusCard.Status.DASAR)
	elif konfirmasi:
		get_viewport().set_input_as_handled()
		permintaan_pindah.emit(self, StatusCard.Status.LEPAS)
