extends Node2D

var speed = 0
@export var acceleration = 10
@export var timeout = .3
var accConstant = .01
var stopped = false

@export var decelCoefficient = .0001

func _input(event):
	if event.is_action_pressed("accel") and not stopped:
		$speedTimeout.start(timeout)
		speed += acceleration + (speed * accConstant)
		
func _process(delta):
	_decelerate(delta)
	$text.text = str(speed).pad_decimals(2)
	
func _decelerate(delta):
	var acc = speed * speed * decelCoefficient
	speed = speed - (acc * delta)


func _on_speed_timeout_timeout():
	stopped = true
	print("timedout")
