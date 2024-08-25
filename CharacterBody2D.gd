extends RigidBody2D

@onready var spear_area = $SpearZone;
@onready var spear_sprite = spear_area.get_node("SpearSprite");
@onready var attack_timer = $SpearZone/AttackTimer;
var can_jump: bool = false;

func _on_attack_timer_timeout():
	spear_sprite.texture=load("res://img/spear_sprite.png")
	spear_area.monitoring = false
	

func _input(event):
	if event.is_action("ui_right"):
		apply_force(Vector2(100.0,0.0))
	elif event.is_action("ui_left"):
		apply_force(Vector2(-100.0,0.0))
	
	if event.is_action_pressed("ui_up") and can_jump:
		apply_central_impulse(Vector2(0.0,-70.0))
		
	if event.is_action_pressed("click"):
		_activate_attack()

func _activate_attack():
	spear_sprite.texture=load("res://img/spear_sprite_atk.png")
	spear_area.monitoring = true
	attack_timer.start(0.2)

func _physics_process(delta: float) -> void:
	can_jump = $RayCast2D.is_colliding();

func _process(delta):
	var mouse_pos = get_global_mouse_position();
	var direction = mouse_pos - global_position;
	
	spear_area.rotation = direction.angle() - global_rotation;
	$RayCast2D.global_rotation = 0;
	






