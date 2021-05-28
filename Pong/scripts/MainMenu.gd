extends MarginContainer

const pong_scene = preload("res://scenes/Root.tscn")

onready var selector_one = $Center/VBoxContainer/OptionContainer/Options/Option1/Line/Selector
onready var selector_two = $Center/VBoxContainer/OptionContainer/Options/Option2/Line/Selector

var current_selection = 0

func _ready():
	set_current_selection(0)

func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 1:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)
	elif Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func set_current_selection(_current_selection):
	selector_one.text = ''
	selector_two.text = ''
	if _current_selection == 0:
		selector_one.text = '>'
	elif _current_selection == 1:
		selector_two.text = '>'

func handle_selection(_current_selection):
	if _current_selection == 0:
		get_parent().add_child(pong_scene.instance())
		queue_free()
	elif _current_selection == 1:
		get_tree().quit()
