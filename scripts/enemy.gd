extends KinematicBody2D

export var speed = 150
export var speed_range = 0.5
export var friction = 0.01
export var friction_range = 0.5
export var acceleration = 0.1
export var acceleration_range = 0.5


var velocity = Vector2()
var player_pawn
var death_sounds = [
	"res://sounds/Scream_1.mp3",
	"res://sounds/Weeping.mp3",
	"res://sounds/Death_Gurgle.mp3",
	"res://sounds/Thats_what_you_get.mp3",
	"res://sounds/Ouch.mp3",
	"res://sounds/Grunt.mp3",
	"res://sounds/Blugh.mp3",
]

func _ready():
	player_pawn = get_parent().get_node("player")
	speed *= 1 + rand_range(-speed_range, speed_range)
	friction *= 1 + rand_range(-friction_range, friction_range)
	acceleration *= 1 + rand_range(-acceleration_range, acceleration_range)


func get_heading():
	var heading = Vector2()

	var target = Vector2()
	if is_instance_valid(player_pawn):
		target = player_pawn.global_position
	else:
		target = self.global_position

	heading = target - self.global_position

	return heading

func _physics_process(delta):
	var direction = get_heading()

	look_at(direction)

	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)

	velocity = move_and_slide(velocity)

func _exit_tree() -> void:
	var sound = death_sounds[randi() % death_sounds.size()]
	Sounds.play(sound)
	Sounds.play("res://sounds/Squelch.mp3")