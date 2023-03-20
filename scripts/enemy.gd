extends KinematicBody2D

export var speed = 150
export var friction = 0.01
export var acceleration = 0.1

var velocity = Vector2()
var player_pawn

func _ready():
	player_pawn = get_parent().get_node("player")


func get_heading():
	var heading = Vector2()
<<<<<<< HEAD
	
	var target = Vector2()
	if is_instance_valid(player_pawn):
		target = player_pawn.global_position
	else:
		target = self.global_position
	
	heading = target - self.global_position
	
=======

	var player_loc = player_pawn.global_position

	heading = player_loc - self.global_position

>>>>>>> 151712cf7c074ecebdecdc8c37f56ab8d5c3007c
	return heading

func _physics_process(delta):
	var direction = get_heading()

	look_at(direction)

	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)

	velocity = move_and_slide(velocity)
<<<<<<< HEAD
	
=======

>>>>>>> 151712cf7c074ecebdecdc8c37f56ab8d5c3007c
