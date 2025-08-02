extends Node2D

@export_range(1.0, 5.0) var speed : float = 1.0

func update_speed(new_speed) -> void:
	$wheel/AnimationPlayer.speed_scale = new_speed
	$hammy_run/AnimationPlayer.speed_scale = new_speed

func _process(delta: float):
	update_speed(speed)
