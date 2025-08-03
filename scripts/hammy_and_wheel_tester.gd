extends Node2D

var dust_threshold = 2.0
@export_range(1.0, 5.0) var speed : float = 1.0


func update_speed(new_speed) -> void:
	$wheel/wheel/AnimationPlayer.speed_scale = new_speed
	$hammy_run/AnimationPlayer.speed_scale = new_speed
	if new_speed > dust_threshold:
		$SmokeNDustP03Vfx1.visible = true
	else:
		$SmokeNDustP03Vfx1.visible = false

func _process(delta: float):
	update_speed(speed)
