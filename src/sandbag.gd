extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func spear(angle: float, force: Vector2):
	var kick = Vector2(5.0,0.0).rotated(angle);
	var adjusted_force = Vector2(1.0,0.0).rotated(angle)*force.length();
	apply_impulse(adjusted_force + kick);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
