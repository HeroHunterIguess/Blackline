extends CanvasLayer

var close_cooldown = 0.5

func _process(delta):
	# lower cooldown
	if get_tree().paused == true:
		close_cooldown -= 1 * delta
	
	# close pause menu
	if Input.is_action_just_pressed("pause") && close_cooldown <= 0:
		get_tree().paused = false
		close_cooldown = 0.5


func _on_resume_button_pressed() -> void:
	get_tree().paused = false
	close_cooldown = 0.5
