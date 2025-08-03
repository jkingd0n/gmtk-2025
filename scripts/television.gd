extends Node2D

func _ready():
	_turn_on()

func _turn_on():
	$Noise/AnimationPlayer.play("on")

func _shut_down():
	$Noise/AnimationPlayer.play("off")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "on":
		$Noise/AnimationPlayer.play("static")

func _on_game_over() -> void:
	_shut_down()
