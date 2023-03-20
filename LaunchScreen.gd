extends CanvasLayer

onready var tween = $Tween

func appear():
	tween.interpolate_property(self, "offset:x", 500, 0,
					0.5, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	tween.start()

func disappear():
	tween.interpolate_property(self, "offset:x", 0, 500,
					0.4, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	tween.start()

func _physics_process(delta):
	# If the player clicks anywhere, move scenes to the level
	if Input.is_action_pressed("shoot"):
		# Change scene to "level.tscn"
		get_tree().change_scene("res://level.tscn")
