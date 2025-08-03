extends Node2D

var dust_threshold = 2.0
@export var current_speed : float = 1

func update_speed(new_speed) -> void:
	current_speed = new_speed
	if new_speed > dust_threshold:
		$SmokeNDustP03Vfx1.visible = true
	else:
		$SmokeNDustP03Vfx1.visible = false
	$wheel/wheel/AnimationPlayer.speed_scale = new_speed
	$hammy_run/AnimationPlayer.speed_scale = new_speed
	if new_speed > 0:
		if not $wheel/wheel/AudioStreamPlayer2D.playing:
			$wheel/wheel/AudioStreamPlayer2D.play()
		$wheel/wheel/AudioStreamPlayer2D.pitch_scale = new_speed
