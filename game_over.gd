extends CanvasLayer

signal restart

func _on_restart_game_pressed() -> void:
	restart.emit()
