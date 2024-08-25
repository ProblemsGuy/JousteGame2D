extends Area2D

@onready var spear_area = $SpearZone;
@onready var spear_sprite = $SpearSprite;
@onready var attack_timer = $AttackTimer;

func _ready():
	monitoring = false;

func _on_attack_timer_timeout():
	spear_sprite.texture=load("res://img/spear_sprite.png")
	monitoring = false

func _activate_attack():
	spear_sprite.texture=load("res://img/spear_sprite_atk.png")
	monitoring = true
	attack_timer.start(0.2)

func _process(_delta):
	var mouse_pos = get_global_mouse_position();
	var direction = mouse_pos - global_position;
	global_rotation = direction.angle();
	
	if monitoring:
		print("Monitoring")
		var speared_bodies = get_overlapping_bodies();
		for i in speared_bodies.size():
			print(i);
			var body = speared_bodies[i];
			if body.name == "Sandbag":
				print("Found");
				body.spear(global_rotation, get_parent().linear_velocity);
				attack_timer.stop();
				_on_attack_timer_timeout();
				
			
