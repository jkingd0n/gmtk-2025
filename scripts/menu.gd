extends Node2D

var speed : float = 0
@export var acceleration = 20
@export var timeout = .3
var accConstant = .01
var animation_coefficient : float = .04
var animation_speed = 0
@export var decelCoefficient = .1
var game_over : bool = false
var timestamp_last_pressed : float = 0
var sweat_threshold : float = .15

func _input(event):
	if event.is_action_pressed("accel"):
		timestamp_last_pressed = Time.get_unix_time_from_system()
		speed += acceleration + (speed * accConstant)
		animation_speed = animation_coefficient * speed
		print("speed: " + str(speed))
		print("anim speed: " + str(animation_speed))
		$hammy_and_wheel.update_speed(animation_speed)
		$ProgressBar.value += 1
		if $ProgressBar.value == $ProgressBar.max_value:
			start_game()
			

func start_game():
	get_tree().change_scene_to_file("res://scenes/Main_Game.tscn")
	
func _on_button_pressed() -> void:
	start_game()
