extends Node2D

var speed = 0
@export_range(1,100, .1) var acceleration:float = 10
@export var timeout: float = .3
@export_range(1,2, .001) var exponent: float = 2
@export_range(0, 1, .001) var accConstant:float = .01
var stopped = false

@export_range(0, .1, .0001) var decelCoefficient = .0001

func _input(event):
	if event.is_action_pressed("accel") and not stopped:
		$speedTimeout.start(timeout)
		speed += acceleration + (speed * accConstant)
		
func _process(delta):
	_decelerate(delta)
	$text.text = str(speed).pad_decimals(2)
	
func _decelerate(delta):
	var acc = pow(speed, exponent) * decelCoefficient
	speed = speed - (acc * delta)


func _on_speed_timeout_timeout():
	#stopped = true
	print("timedout")
