extends Node2D

var player_pawn
var death_label
var restart_label

var player_char
var camera


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_pawn = get_node("player")
	death_label = get_node("camera/death_label")
	restart_label = get_node("camera/restart_label")
	
	player_char = preload("res://player.tscn")

func _process(delta):
	
	if !is_instance_valid(player_pawn):
		death_label.visible = true
		restart_label.visible = true
	else:
		death_label.visible = false
		restart_label.visible = false
	
	if death_label.visible:
		if Input.is_action_just_pressed("restart"):
			get_tree().change_scene("res://level.tscn")
