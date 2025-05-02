extends RigidBody2D

var time_alive = 0
const BALL_LIFE_TIME = 2 # seconds

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_alive += delta
	if time_alive > BALL_LIFE_TIME:
		queue_free()
	pass
	
func _physics_process(delta: float) -> void:
	pass

func _on_body_entered(body: Node) -> void:
	print("BallScene - collision %s" % body.name)
