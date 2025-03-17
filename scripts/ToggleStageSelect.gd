extends LinkButton

@onready var vbox_container = get_parent().get_parent()


func _on_pressed() -> void:
	var new_game_buttons = vbox_container.get_node("MainMenuButtons")
	new_game_buttons.visible = !new_game_buttons.visible

	var stage_select_buttons = vbox_container.get_node("StageSelectButtons")
	stage_select_buttons.visible = !stage_select_buttons.visible
