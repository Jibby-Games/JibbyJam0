extends Timer

var spawn_distance = 1000

var player_pawn

var obj = preload("res://powerup.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	player_pawn = get_parent().get_node("camera")


func _on_pill_spawner_timeout():
	if player_pawn == null:
		return

	var pill = obj.instance()
	var angle = randf() * TAU
	var center = player_pawn.global_position

	var spawn_loc = (Vector2(cos(angle), sin(angle)) * spawn_distance) + center

	pill.global_position = spawn_loc

	get_parent().add_child(pill)
