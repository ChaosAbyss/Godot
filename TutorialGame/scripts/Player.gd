extends Area2D

signal hit

export var speed = 400.0
var screen_size = Vector2.ZERO

func _ready():
	screen_size = get_viewport_rect().size
	hide()

func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("up"):
		direction.y -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("right"):
		direction.x += 1
	
	if direction.length() > 0:
		direction = direction.normalized()
		$Sprite.play()
	else:
		$Sprite.stop()
	
	if direction.x != 0:
		$Sprite.animation = "walk"
		$Sprite.flip_h = direction.x < 0
		$Sprite.flip_v = false
	elif direction.y != 0:
		$Sprite.animation = "up"
		$Sprite.flip_v = direction.y > 0
		$Sprite.flip_h = false

	position += direction * speed * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func start(new_position):
	position = new_position
	show()
	$Collision.disabled = false

func _on_Player_body_entered(body):
	hide()
	$Collision.set_deferred("disabled", true)
	emit_signal("hit")
	
