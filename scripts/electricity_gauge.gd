extends Node2D

@export_range(0, 100) var remaining : int = 50

func _ready():
	$calculateEnergy.start()

func _on_calculate_energy_timeout() -> void:
	if remaining == 0:
		$text.text = "Game Over!"   
		$calculate_energy.stop()
		return
	if $"..".speed > 50:
		remaining = min(remaining+1, 100)
	else:
		remaining -= 1
	$text.text = str(remaining)
	$calculateEnergy.start()
