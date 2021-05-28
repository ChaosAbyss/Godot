extends Camera

func _physics_process(delta):
	look_at($'../'.translation, Vector3(0,1,0))
