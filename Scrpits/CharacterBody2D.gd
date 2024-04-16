extends CharacterBody2D

var direccio := Vector2(0,0)
var velocitat = 200
var gravetat := Vector2.DOWN * 980



func _process(delta):
	direccio = Vector2(0,0)
	velocity.x = 200
	
	if Input.is_action_just_pressed("saltar") and is_on_floor():
		velocity += Vector2.UP * 330
	
	
		
	velocity += gravetat * delta
	velocity +=  direccio.normalized() * velocitat
	move_and_slide()
	
	if velocity.y < 0:
		$Animacio.play('saltar')
	elif velocity.y > 0:
		$Animacio.play('saltar')
	elif velocity.x > 0:
		$Animacio.play('correr')
		$Animacio.flip_h = false
	elif velocity.x < 0:
		$Animacio.play('correr')
		$Animacio.flip_h = true
	else:
		$Animacio.play('quiet')
