extends CanvasLayer

onready var animation = $Control/AnimationPlayer
var scene

func change_scene(new_scene, anim):
	scene = new_scene
	animation.play(anim)

func _new_scene():
	get_tree().change_scene(scene)
