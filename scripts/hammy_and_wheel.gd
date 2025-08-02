extends Node2D

@export var current_speed : float = 1

func update_speed(new_speed) -> void:
	$wheel/AnimationPlayer.speed_scale = new_speed
	$hammy_run/AnimationPlayer.speed_scale = new_speed
	current_speed = new_speed
