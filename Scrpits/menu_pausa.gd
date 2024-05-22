extends Control

func resume():
	get_tree().paused = false
	hide()

func pause():
	get_tree().paused = true
	show()
	
func testESC():
	if Input.is_action_just_pressed("pausar") and get_tree().paused == false:
		pause()
	elif  Input.is_action_just_pressed("pausar") and get_tree().paused == true:
		resume()
	

func _on_resume_pressed():
	resume()


func _on_restart_pressed():
	resume()
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().quit()
	
	
func _process(delta):
	testESC()

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Escenes/menu.tscn")
