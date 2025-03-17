extends LinkButton

@export var scene_to_load: String

var scenes = ["Level 1", "Level 2"]


func _on_pressed() -> void:
	if scene_to_load in scenes:
		Global.lives = 3
	get_tree().change_scene_to_file("res://scenes/" + scene_to_load + ".tscn")
