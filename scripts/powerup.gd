extends Area2D

var player_pawn

var num_upgrade_options = 4

var speed_bump = 10
var accel_bump = 0.05
var reload_mult = 0.9
var bullet_speed_mult = 1.1


func _ready():
	player_pawn = get_parent().get_node("player")

func upgrade_speed():
	print("Upgrading speed")
	player_pawn.speed += speed_bump
	print("Speed is now ", player_pawn.speed)

func upgrade_accel():
	print("Upgrading accel")
	player_pawn.acceleration += accel_bump
	print("Acceleration is now ", player_pawn.acceleration)

func upgrade_reload():
	print("Upgrading reload")
	player_pawn.reload_time *= reload_mult
	print("Reload time is now ", player_pawn.reload_time)

func upgrade_bullet_speed():
	print("Upgrading bullet speed")
	player_pawn.bullet_spped_mult *= bullet_speed_mult
	print("Bullet speed mult is now ", player_pawn.bullet_spped_mult)

func _on_powerup_body_entered(body:Node) -> void:
	Sounds.play("res://sounds/Eat_Up.mp3")
	Sounds.play("res://sounds/PowerUp.mp3")
	queue_free()

	if !is_instance_valid(player_pawn):
		return

	var choice = randi() % num_upgrade_options
	if choice == 0:
		upgrade_speed()
	elif choice == 1:
		upgrade_accel()
	elif choice == 2:
		upgrade_reload()
	elif choice == 3:
		upgrade_bullet_speed()
	else:
		print("Got a choice I didnt expect: ", choice)
