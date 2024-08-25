extends RigidBody2D

@onready var spear_area = $SpearZone;
var can_jump: bool = false;

func _input(event):
	if event.is_action("ui_right"):
		apply_force(Vector2(100.0,0.0))
	elif event.is_action("ui_left"):
		apply_force(Vector2(-100.0,0.0))
	
	if event.is_action_pressed("ui_up") and can_jump:
		apply_central_impulse(Vector2(0.0,-70.0))
		
	if event.is_action_pressed("click"):
		spear_area._activate_attack()

func _physics_process(_delta: float) -> void:
	can_jump = $AnchorCast2D.is_colliding();

func _process(_delta):
	$AnchorCast2D.global_rotation = 0;
	
