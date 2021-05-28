extends KinematicBody

const GRAVITY = -10
const SPEED = 400
const ROTATION = 3
var vel = Vector3()

func _process(delta):
	var dir = Vector3()
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_pressed("ui_left"):
		rotate_y(ROTATION * delta)
	if Input.is_action_pressed("ui_right"):
		rotate_y(-ROTATION * delta)
	if Input.is_action_pressed("ui_up"):
		dir.z = -1
	if Input.is_action_pressed("ui_down"):
		dir.z = 1

	if dir:
		dir *= SPEED * delta
		dir = dir.rotated(Vector3(0,1,0), rotation.y)
		
	vel.x = dir.x
	vel.z = dir.z
	vel.y += GRAVITY * delta
		
	
	vel = move_and_slide(vel, Vector3(0,1,0))


