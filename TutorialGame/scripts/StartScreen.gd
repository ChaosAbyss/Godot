extends CanvasLayer

signal easy_game
signal medium_game
signal hard_game
signal new_game

func update_score(score):
	$Menus/MainMenu/Score/CenteredScore/ScoreLabel.text = str(score)
	
func show_message(text):
	$Menus/MainMenu/MainContainer/CenteredTitle/Title.text = text
	$Menus/MainMenu/MainContainer/CenteredTitle/Title.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$Menus/MainMenu/MainContainer/CenteredTitle/Title.text = "Dodge the creeps"
	$Menus/MainMenu/MainContainer/CenteredTitle/Title.show()
	yield(get_tree().create_timer(1.0), "timeout")
	$Menus/MainMenu/MainContainer/CenteredButtons/Lines/CenteredStart/Start.show()
	$Menus/MainMenu/MainContainer/CenteredButtons/Lines/CenteredSettings/Settings.show()
	$Menus/MainMenu/MainContainer/CenteredButtons/Lines/CenteredQuit/Quit.show()

func _ready():
	$Menus/MainMenu/Score/CenteredScore/ScoreLabel.hide()

func _on_Easy_pressed():
	$MessageTimer.start()
	$Menus/MainMenu/Score/CenteredScore/ScoreLabel.show()
	$Menus/MainMenu/MainContainer/CenteredButtons/Lines/CenteredStart/Start.hide()
	$Menus/MainMenu/MainContainer/CenteredButtons/Lines/CenteredSettings/Settings.hide()
	$Menus/MainMenu/MainContainer/CenteredButtons/Lines/CenteredQuit/Quit.hide()
	emit_signal("easy_game")
	emit_signal("new_game")

func _on_Medium_pressed():
	$MessageTimer.start()
	$Menus/MainMenu/Score/CenteredScore/ScoreLabel.show()
	$Menus/MainMenu/MainContainer/CenteredButtons/Lines/CenteredStart/Start.hide()
	$Menus/MainMenu/MainContainer/CenteredButtons/Lines/CenteredSettings/Settings.hide()
	$Menus/MainMenu/MainContainer/CenteredButtons/Lines/CenteredQuit/Quit.hide()
	emit_signal("medium_game")
	emit_signal("new_game")

func _on_Hard_pressed():
	$MessageTimer.start()
	$Menus/MainMenu/Score/CenteredScore/ScoreLabel.show()
	$Menus/MainMenu/MainContainer/CenteredButtons/Lines/CenteredStart/Start.hide()
	$Menus/MainMenu/MainContainer/CenteredButtons/Lines/CenteredSettings/Settings.hide()
	$Menus/MainMenu/MainContainer/CenteredButtons/Lines/CenteredQuit/Quit.hide()
	emit_signal("hard_game")
	emit_signal("new_game")

func _on_MessageTimer_timeout():
	$Menus/MainMenu/MainContainer/CenteredTitle/Title.hide()
