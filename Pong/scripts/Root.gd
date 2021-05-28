extends Node

var PlayerScore = 0
var EnemyScore = 0

func _on_LeftGoal_body_entered(body):
	score_achieved()
	EnemyScore += 1
	$Ball/SoundLose.play()

func _on_RightGoal_body_entered(body):
	score_achieved()
	PlayerScore += 1
	$Ball/SoundWin.play()

func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$EnemyScore.text = str(EnemyScore)
	$CountdownLabel.text = str(int($Countdown.time_left) + 1)

func _on_Countdown_timeout():
	get_tree().call_group('BallGroup','restart_ball')
	$CountdownLabel.visible = false

func score_achieved():
	$Ball.position = Vector2(512, 300)
	get_tree().call_group('BallGroup','stop_ball')
	$Countdown.start()
	$CountdownLabel.visible = true
