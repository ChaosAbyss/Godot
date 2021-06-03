extends Node

export (PackedScene) var mob_scene
var score = 0

func _ready():
	randomize()
	
func new_game():
	score = 0
	$MainMenu.update_score(score)
	
	get_tree().call_group("mobs", "queue_free")
	$Player.start($StartPosition.position)
	
	$StartTimer.start()
	$MainMenu.show_message("Get ready...")
	yield($StartTimer, "timeout")
	$ScoreTimer.start()
	$MobTimer.start()

func game_over():
	$MainMenu/MessageTimer.stop()
	$MobTimer.stop()
	$MainMenu.show_game_over()

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
	
	var velocity = Vector2(rand_range(mob.min_speed, mob.max_speed), 0)
	mob.linear_velocity = velocity.rotated(direction)


func _on_ScoreTimer_timeout():
	score += 1
	$MainMenu.update_score(score)
