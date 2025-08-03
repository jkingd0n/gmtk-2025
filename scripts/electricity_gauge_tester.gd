extends Node2D

@export_range(0, 100) var speed : float = 0
@export_range(0, 100) var remaining : int = 50
signal electricity_update
signal game_over

func _ready():
	$electricity_timer.start()
	$electricity.value = remaining

func _on_electricity_timer_timeout() -> void:
	# emit event
	electricity_update.emit() 

func update_electricity(speed: float):
	if remaining == 0:
		$electricity_timer.stop()
		game_over.emit()
	if speed > 50:
		remaining = min(remaining+1, 100)
	else:
		remaining = max(remaining-1, 0)
	$electricity.value = remaining
	$electricity_timer.start()

func _process(delta: float):
	update_electricity(speed)
