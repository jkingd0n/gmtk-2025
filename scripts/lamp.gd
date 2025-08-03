extends Node2D

var is_game_over : bool = false
var is_on : bool = false

func _turn_on():
	if is_game_over:
		return
	is_on = true
	$light.show()
	$lamp.frame = 1
	$on.play()
	
func _turn_off():
	is_game_over = true
	if not is_on:
		return
	$light.hide()
	$lamp.frame = 0
	$off.play()

func _on_timer_timeout():
	_turn_on()
