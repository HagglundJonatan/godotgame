extends Area2D

var elapsed = 0
@export var enemy_life_time = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsed += delta
	if elapsed > enemy_life_time * randf_range(0.5, 2.0):
		elapsed = 0
		queue_free()
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Projectiles"):
		get_parent().player_score += 1
		queue_free()
