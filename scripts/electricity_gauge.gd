extends Node2D

@export_range(0, 100) var remaining : int = 50
signal electricity_update
signal game_over
var is_game_over : bool = false
var total_electricity_generated = 0

func _ready():
	$electricity_timer.start()
	$electricity.value = remaining

func _on_electricity_timer_timeout() -> void:
	electricity_update.emit() 

func update_electricity(speed: float):
	if remaining == 0 and not is_game_over:
		$electricity_timer.stop()
		game_over.emit()
		is_game_over = true
	if speed > 50:
		remaining = min(remaining+1, 100)
		total_electricity_generated += 1
	else:
		remaining = max(remaining-1, 0)
	$electricity.value = remaining
	$electricity_timer.start()
