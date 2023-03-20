extends KinematicBody2D

export var speed = 200
export var friction = 0.01
export var acceleration = 0.1
export var reload_time = 0.5
export(PackedScene) var bullet = preload("res://bullet.tscn")

var velocity = Vector2()
var current_reload_time = 0

func get_input():
	var input = Vector2()
	if Input.is_action_pressed('right'):
		input.x += 1
	if Input.is_action_pressed('left'):
		input.x -= 1
	if Input.is_action_pressed('down'):
		input.y += 1
	if Input.is_action_pressed('up'):
		input.y -= 1
	return input

func _physics_process(delta):
	look_at(get_global_mouse_position())
	var direction = get_input()
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	velocity = move_and_slide(velocity)

	current_reload_time -= delta
	if Input.is_action_pressed("shoot") and current_reload_time < 0:
		current_reload_time = reload_time
		shoot()


func player_died():
	Sounds.play("res://sounds/Squelch.mp3")
	print("Player has died!")

	queue_free()

func shoot():
	var b = bullet.instance()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform
	Globals.camera.add_trauma(0.3)
	Sounds.play("res://sounds/Pew.mp3")


func _on_Area2D_body_entered(body):
	if body.is_in_group("enemies"):
		player_died()
