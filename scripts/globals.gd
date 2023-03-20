extends Node


var camera
var score = 0


func add_score():
	score += 1
	var label = get_tree().root.get_node("level/UI/Score")
	if label:
		label.text = "Score: %d" % score