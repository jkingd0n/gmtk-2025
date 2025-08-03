extends Node2D

func _ready():
	$AnimationPlayer.play("idle")

func _turn_on():
	$AnimationPlayer.play("spin")

func _turn_off():
	$AnimationPlayer.play("idle")


func _on_timer_timeout():
	_turn_on()
