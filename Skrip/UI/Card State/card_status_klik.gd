extends StatusCard

func masuk() -> void:
	ui_card.indikator_status.color = Color.GOLDENROD
	ui_card.label_status.text = "KLIK"
	ui_card.area_deteksi.monitoring = true

func on_input(event: InputEvent) -> void:
	
	if event is InputEventMouseMotion:
		
		permintaan_pindah.emit(self, StatusCard.Status.TAHAN)
