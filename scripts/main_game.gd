extends Node2D

var speed : float = 0
@export var acceleration = 20
@export var timeout = .3
var accConstant = .01
var stopped = false
var animation_coefficient : float = .04
var animation_speed = 0
@export var decelCoefficient = .1
var game_over : bool = false

func _input(event):
	if event.is_action_pressed("accel") and not stopped:
		speed += acceleration + (speed * accConstant)
		animation_speed = animation_coefficient * speed
		$hammy_and_wheel.update_speed(animation_speed)
		
func _process(delta):
	_decelerate(delta)
	if not game_over:
		$total_energy.text = str(speed).pad_decimals(2)
	
func _decelerate(delta):
	var acc = speed * speed * decelCoefficient
	speed = speed - (acc * delta)
	animation_speed = animation_coefficient * speed 
	decelCoefficient += (delta * .001)
	$hammy_and_wheel.update_speed(animation_speed)
	
func _on_speed_timeout_timeout():
	stopped = true
	print("timedout")

func _on_electricity_gauge_electricity_update() -> void:
	$electricity_gauge.update_electricity(speed)

func _on_game_over() -> void:
	game_over = true
	$total_energy.text = $total_energy.text + '\n' + "Game Over!" 
