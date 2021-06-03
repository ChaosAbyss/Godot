extends RigidBody2D

func _ready():
	$Sprite.play()
	var mob_types = $Sprite.frames.get_animation_names()
	$Sprite.animation = mob_types[randi() % mob_types.size()]

func _on_Notifier_screen_exited():
	queue_free()
