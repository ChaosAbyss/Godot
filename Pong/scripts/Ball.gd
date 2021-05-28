extends KinematicBody2D

var speed = 400
var velocity = Vector2.ZERO

func _ready():
	randomize()
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = [-0.8, 0.8][randi() % 2]

func _physics_process(delta):
	var collided = move_and_collide(velocity * speed * delta)
	if collided:
		velocity = velocity.bounce(collided.normal)
		if collided.collider.name == "Enemy" or collided.collider.name == "Player":
			$SoundPaddle.play()
		elif collided.collider.name == "TopBorder" or collided.collider.name == "BotBorder":
			$SoundWall.play()

func stop_ball():
	speed = 0

func restart_ball():
	speed = 400
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = [-0.8,0.8][randi() % 2]
