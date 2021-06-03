extends RigidBody2D

export var min_speed = 150.0
export var max_speed = 250.0

func _ready():
	$Sprite.play()
	var mob_types = $Sprite.frames.get_animation_names()
	$Sprite.animation = mob_types[randi() % mob_types.size()]


func _on_Notifier_screen_exited():
	queue_free()
