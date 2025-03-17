extends Area2D

@export var scene_name: String = "Level 1"


func _on_area_trigger_body_entered(body):
	var current_scene = get_tree().current_scene.name if get_tree().current_scene else ""

	if body.name == "Player":
		if current_scene == sceneName:
			Global.lives -= 1

		if Global.lives == 0:
			get_tree().call_deferred("change_scene_to_file", "res://scenes/Game Over.tscn")
		else:
			get_tree().call_deferred("change_scene_to_file", "res://scenes/" + sceneName + ".tscn")
