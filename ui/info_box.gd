extends Node2D

var row1 = Vector2(10, 20)
var row2 = Vector2(10, 40)
var row3 = Vector2(10, 60)
@onready var player = get_parent().get_node("Player") 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _draw() -> void:
	draw_rect(Rect2(0, 0, 250, 80), Color.BLUE, false, 2.0)
	
	var font = load('res://fonts/cs-camilo-mono-font/CsCamiloMonoRegularDemo-8Og3g.otf')
	var player_pos_str = "Player pos x:%.2f" % player.player_global_pos.x + " y:%.2f " % player.player_global_pos.y
	var target_pos_str = "Target pos x:%.2f" % player.target_pos.x + " y:%.2f" % player.target_pos.y
	var player_score_str = "Score: %d" % get_parent().player_score
	draw_string(font, row1, player_pos_str, HORIZONTAL_ALIGNMENT_LEFT, -1, 16)
	draw_string(font, row2, target_pos_str, HORIZONTAL_ALIGNMENT_LEFT, -1, 16)
	draw_string(font, row3, player_score_str, HORIZONTAL_ALIGNMENT_LEFT, -1, 16)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	queue_redraw()
	pass
