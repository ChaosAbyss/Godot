extends Node

export (PackedScene) var mob_scene
var score = 0
var min_speed
var max_speed

func _ready():
	randomize()
	
func new_game():
	score = 0
	$StartScreen.update_score(score)
	
	get_tree().call_group("mobs", "queue_free")
	$Player.start($StartPosition.position)
	
	$StartTimer.start()
	$StartScreen.show_message("Get ready...")
	yield($StartTimer, "timeout")
	$ScoreTimer.start()
	$MobTimer.start()

func game_over():
	$ScoreTimer.stop()
	$StartScreen/MessageTimer.stop()
	$MobTimer.stop()
	$StartScreen.show_game_over()

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func _on_MobTimer_timeout():
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.unit_offset = randf()

	var mob = mob_scene.instance()
	add_child(mob)
	
	mob.position = mob_spawn_location.position
	
	var direction = mob_spawn_location.rotation + PI / 2
	direction += rand_range(-PI / 4, PI / 4)
	mob.rotation = direction
	
	var velocity = Vector2(rand_range(min_speed, max_speed), 0)
	mob.linear_velocity = velocity.rotated(direction)

func _on_StartScreen_easy_game():
	min_speed = 125.0
	max_speed = 175.0
	$MobTimer.wait_time = 0.5

func _on_StartScreen_medium_game():
	min_speed = 175.0
	max_speed = 250.0
	$MobTimer.wait_time = 0.4

func _on_StartScreen_hard_game():
	min_speed = 250.0
	max_speed = 300.0
	$MobTimer.wait_time = 0.3

func _on_ScoreTimer_timeout():
	score += 1
	$StartScreen.update_score(score)
