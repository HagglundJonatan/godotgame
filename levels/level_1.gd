extends Node2D

@export var enemy_scene: PackedScene = preload("res://assets/Enemy.tscn")

var spawn_timer = 0
@export var spawn_rate = 3
var player_score = 0
@export var game_time = 10
var elapsed = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Level1 - _ready()")
	pass # Replace with function body.
	
func spawn_enemy() -> void:
	var instance = enemy_scene.instantiate() as Area2D
	instance.global_position = Vector2(randf_range(50, 1150), 450)
	add_child(instance)
	
# Called every frame. 'delta' is the spawn_timer time since the previous frame.
func _process(delta: float) -> void:
	spawn_timer += delta
	elapsed += delta
	
	if spawn_timer > spawn_rate:
		spawn_enemy()
		spawn_timer = 0
		
	if elapsed > game_time:
		print("Time's up! Your score is %d" % player_score)

		
		
