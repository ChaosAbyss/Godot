extends Node2D

func _on_Start_pressed():
	get_node("DifficultyMenu").slide(Vector2(0, 0))
	get_node("MainMenu").slide(Vector2(-576, 0))

func _on_Return_pressed():
	get_node("MainMenu").slide(Vector2(0, 0))
	get_node("DifficultyMenu").slide(Vector2(576, 0))

func _on_Quit_pressed():
	get_tree().quit()

func _on_Easy_pressed():
	get_node("MainMenu").slide(Vector2(0, 0))
	get_node("DifficultyMenu").slide(Vector2(576, 0))

func _on_Medium_pressed():
	get_node("MainMenu").slide(Vector2(0, 0))
	get_node("DifficultyMenu").slide(Vector2(576, 0))

func _on_Hard_pressed():
	get_node("MainMenu").slide(Vector2(0, 0))
	get_node("DifficultyMenu").slide(Vector2(576, 0))
