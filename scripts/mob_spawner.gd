extends Timer

var spawn_distance = 1000
var timeout_count = 0

var min_spawn = 2.0
var max_spawn = 15.0
var drop_rate = 0.9

var player_pawn

var mob = preload("res://enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	player_pawn = get_parent().get_node("camera")

func _on_mob_spawner_timeout():
	if player_pawn == null:
		return

	var enemy = mob.instance()
	var angle = randf() * TAU
	var center = player_pawn.global_position

	var spawn_loc = (Vector2(cos(angle), sin(angle)) * spawn_distance) + center

	enemy.global_position = spawn_loc


	get_parent().add_child(enemy)

	timeout_count += 1

	self.wait_time = min_spawn + max_spawn * exp(-drop_rate * timeout_count)
