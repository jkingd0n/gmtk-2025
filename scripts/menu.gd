extends Node2D

func start_game():
	get_tree().change_scene_to_file("res://scenes/Main_Game.tscn")
	
func _on_button_pressed() -> void:
	start_game()
