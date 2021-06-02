extends KinematicBody2D

var speed = 10
var velocity = Vector2.ZERO

func _ready():
	randomize()
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = [-0.8, 0.8][randi() % 2]

func _process(delta):
	velocity = Vector2(speed * velocity.x * delta, speed * velocity.y * delta)
	move_and_slide(velocity)
