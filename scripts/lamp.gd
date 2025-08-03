extends Node2D

func _turn_on():
	$light.show()
	
func _turn_off():
	$light.hide()

func _on_timer_timeout():
	_turn_on()
