extends Timer

var spawn_distance = 1000

var player_pawn

var mob = preload("res://enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	player_pawn = get_parent().get_node("player")


func _on_mob_spawner_timeout():
	var enemy = mob.instance()
	
	var angle = randf() * 2.0 * 3.14159
	var center = player_pawn.position
	
	var spawn_loc = (Vector2(cos(angle), sin(angle)) * spawn_distance) + center

	enemy.position = spawn_loc

	
	get_parent().add_child(enemy)
