extends KinematicBody

const GRAVITY = -20
const SPEED = 200
const JUMP_SPEED = 12
const ROTATION = 0.005

var vel = Vector3()
var rot_x = 0
var rot_y = 0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	var dir = Vector3()
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_pressed("ui_left"):
		dir.x = -1
	if Input.is_action_pressed("ui_right"):
		dir.x = 1
	if Input.is_action_pressed("ui_up"):
		dir.z = -1
	if Input.is_action_pressed("ui_down"):
		dir.z = 1
	if Input.is_action_just_pressed("ui_select"):
		if is_on_floor():
			vel.y = JUMP_SPEED
		
	if dir:
		dir *= SPEED * delta
		dir = dir.rotated(Vector3(0,1,0), rotation.y)
		
	vel.x = dir.x
	vel.z = dir.z
	vel.y += GRAVITY * delta

	vel = move_and_slide(vel, Vector3(0,1,0))
 
func _input(e):
	if e is InputEventMouseMotion:
		rot_y -= e.relative.x * ROTATION
		rot_x -= e.relative.y * ROTATION
		
		if rot_x < -1: rot_x = -1
		elif rot_x > 1: rot_x = 1

		transform.basis = Basis(Vector3(0,1,0), rot_y)
		$Anchor.transform.basis = Basis(Vector3(1,0,0), rot_x)
