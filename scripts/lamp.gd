extends Node2D

func _turn_on():
	$light.show()
	$lamp.frame = 1
	
func _turn_off():
	$light.hide()
	$lamp.frame = 0

func _on_timer_timeout():
	_turn_on()
