extends CanvasLayer

signal start_game

func update_score(score):
	$Score.text = str(score)
	
func show_message(text):
	$CenterContainer/VBoxContainer/CenterContainer/VBoxContainer/Title.text = text
	$CenterContainer/VBoxContainer/CenterContainer/VBoxContainer/Title.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$CenterContainer/VBoxContainer/CenterContainer/VBoxContainer/Title.text = "Dodge the creeps"
	$CenterContainer/VBoxContainer/CenterContainer/VBoxContainer/Title.show()
	yield(get_tree().create_timer(1.0), "timeout")
	$CenterContainer/VBoxContainer/CenterContainer/VBoxContainer/Start.show()

func _on_Start_pressed():
	$CenterContainer/VBoxContainer/CenterContainer/VBoxContainer/Start.hide()
	emit_signal("start_game")

func _on_MessageTimer_timeout():
	$CenterContainer/VBoxContainer/CenterContainer/VBoxContainer/Title.hide()
