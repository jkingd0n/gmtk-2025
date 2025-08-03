extends Sprite2D

func _ready():
	$AnimationPlayer.play("run")

func normal():
	$AnimationPlayer.play("run")

func fast():
	$AnimationPlayer.play("fast")
