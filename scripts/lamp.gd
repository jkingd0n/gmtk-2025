extends Node2D

func _turn_on():
	$light.show()
	$on.play()
	
func _turn_off():
	$light.hide()
	$off.play()

func _on_timer_timeout():
	_turn_on()
