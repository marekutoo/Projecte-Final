extends CharacterBody2D

var direccio := Vector2(0,0)
var velocitat = 200
var gravetat := Vector2.DOWN * 980
var ajupit := false


func _process(delta):
	direccio = Vector2(0,0)
	velocity.x = 100
	
	if Input.is_action_just_pressed("saltar") and is_on_floor():
		velocity += Vector2.UP * 330
	if Input.is_action_just_pressed("ajupir-se"):# and is_on_floor():
		ajupte()
	
	velocity += gravetat * delta
	velocity +=  direccio.normalized() * velocitat
	move_and_slide()
	anima()

func anima():
	if not ajupit:
		if velocity.y < 0:
			$Animacio.play('saltar')
		elif velocity.y > 0:
			$Animacio.play('saltar')
		elif velocity.x > 0:
			$Animacio.play('correr')
	else:
		$Animacio.play("ajup-te")

func ajupte():
	ajupit = true
	$FormaAjupit.set_deferred("disabled", false)
	$FormaDret.set_deferred("disabled", true)
	
func aixecat():
	ajupit = false
	$FormaAjupit.set_deferred("disabled", true)
	$FormaDret.set_deferred("disabled", false)
	
	
