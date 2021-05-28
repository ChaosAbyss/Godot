extends KinematicBody2D

var speed = 300

func _physics_process(delta):
	var velocity = Vector2.ZERO

	if Input.is_action_just_pressed('ui_cancel'):
		get_tree().quit()
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1

	move_and_slide(velocity * speed)
