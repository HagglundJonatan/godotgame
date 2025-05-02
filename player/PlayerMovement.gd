extends CharacterBody2D

@export var ball_scene: PackedScene = preload("res://player/BallScene.tscn")
@export var speed = 30.0
@export var fire_power = 10.0
var forward_direction = Vector2.RIGHT
@export var target_pos = Vector2.ZERO
@export var player_global_pos = Vector2.ZERO
@export var target_global_pos = Vector2.ZERO
var elapsed = 0
var firing_rate = 1
#var velocity = Vector2(250, 250)

# Called when the node enters the scene tree for the first time.
func _ready():
	motion_mode = MOTION_MODE_FLOATING	
	pass # Replace with function body.

func _input(event):
	#print(event.as_text())
	pass

func _process(delta):
	pass
	
	
func _draw():
	draw_line(Vector2(0,0), to_local(target_pos), Color.GREEN, 3)
	draw_circle(Vector2(0,0), 3, Color.BLUE)
	
	var font = load('res://fonts/cs-camilo-mono-font/CsCamiloMonoRegularDemo-8Og3g.otf')
	var target_pos_str = "%.2f, " % target_pos.x + "%.2f" % target_pos.y
	#print("target pos: %.2f" % target_pos.x + "y: %.2f" % target_pos.y)
	var player_pos_str = "%.2f, " % global_position.x + "%.2f" % global_position.y
	draw_string(font, to_local(target_pos), target_pos_str, HORIZONTAL_ALIGNMENT_CENTER)
	draw_string(font, Vector2(0,0), player_pos_str, HORIZONTAL_ALIGNMENT_CENTER)
	
	
func fire():
	var instance = ball_scene.instantiate() as RigidBody2D
	instance.global_position = position
	get_parent().add_child(instance)
	instance.apply_impulse(to_local(target_pos) * fire_power)


func get_input(delta):	
	var input_direction_move = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var mouse_position = get_global_mouse_position()
	player_global_pos = global_position
	
	
	target_pos = mouse_position
	#print("target pos: %.2f" % target_pos.x + "y: %.2f" % target_pos.y)
	target_global_pos = target_pos
	queue_redraw()
	velocity = input_direction_move * speed
		

func _physics_process(delta):
	elapsed += delta
	if elapsed > firing_rate:
		fire()#!
		elapsed = 0
	get_input(delta)
	#look_at(target_pos)
	move_and_collide(velocity * delta)
	
