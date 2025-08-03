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
		$hammy_and_wheel.update_speed(animation_speed)
		
func _process(delta):
	_decelerate(delta)
	var delta_pressed = Time.get_unix_time_from_system() - timestamp_last_pressed
	if delta_pressed > sweat_threshold:
		$hammy_and_wheel/hammy_run.normal()
	else:
		$hammy_and_wheel/hammy_run.fast()
	if not game_over:
		$total_energy.text = "kilowatts: " + str($electricity_gauge.total_electricity_generated)
	
func _decelerate(delta):
	var acc = speed * speed * decelCoefficient
	speed = speed - (acc * delta)
	animation_speed = animation_coefficient * speed 
	decelCoefficient += (delta * .001)
	$hammy_and_wheel.update_speed(animation_speed)

func _on_electricity_gauge_electricity_update() -> void:
	$electricity_gauge.update_electricity(speed)

func _on_game_over() -> void:
	game_over = true
	$Fan._turn_off()
	$total_energy.text = $total_energy.text + '\n' + "Game Over!" 
	$game_reset.start()
	
func _on_game_reset_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
