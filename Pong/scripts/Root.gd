extends Node

const SCORE = 10
var EnemyScore = 0
var PlayerScore = 0
onready var screen

func _on_LeftGoal_body_entered(body):
	score_achieved()
	EnemyScore += 1
	$Ball/SoundLose.play()
	if EnemyScore == SCORE:
		SceneChanger.change_scene('res://scenes/YouLose.tscn', 'fade')

func _on_RightGoal_body_entered(body):
	score_achieved()
	PlayerScore += 1
	$Ball/SoundWin.play()
	if PlayerScore == SCORE:
		SceneChanger.change_scene('res://scenes/YouWin.tscn', 'fade')

func _on_Countdown_timeout():
	get_tree().call_group('BallGroup','restart_ball')
	$CountdownLabel.visible = false

func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$EnemyScore.text = str(EnemyScore)
	$CountdownLabel.text = str(int($Countdown.time_left) + 1)

func score_achieved():
	$Ball.position = Vector2(512, 300)
	get_tree().call_group('BallGroup','stop_ball')
	$Countdown.start()
	$CountdownLabel.visible = true
