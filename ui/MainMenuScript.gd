extends Node

@onready var startNewGameBtn = $StartNewGameBtn
@onready var loadGameBtn = $LoadGameBtn
@onready var buttons = [startNewGameBtn, loadGameBtn]

# Called when the node enters the scene tree for the first time.
func _ready():
	for button in buttons:
		button.pressed.connect(on_pressed.bind(button))
		
func _input(event):
	print(event.as_text())
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_pressed(button: Button):
	if button == startNewGameBtn:
		print("Start " + button.name)
		get_tree().change_scene_to_file('res://levels/Level1.tscn')
	elif button == loadGameBtn:
		print("Load " + button.name)
		get_tree().change_scene_to_file('res://levels/Level1.tscn')
		
