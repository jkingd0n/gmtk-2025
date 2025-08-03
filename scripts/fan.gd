extends Node2D

func _ready():
	$AnimationPlayer.play("idle")

func _turn_on():
	$AnimationPlayer.play("spin")
	$on.play()

func _turn_off():
	$AnimationPlayer.play("idle")
	$on.stop()
	$off.play()

func _on_timer_timeout():
	_turn_on()
