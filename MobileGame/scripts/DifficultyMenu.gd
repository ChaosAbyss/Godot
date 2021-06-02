extends Node2D

func slide(target):
	var tween = get_node("Tween")
	tween.interpolate_property(self, "position", position, target, 2, Tween.TRANS_QUINT, Tween.EASE_OUT)
	tween.start()
