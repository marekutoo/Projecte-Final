extends CharacterBody2D

var direccio := Vector2(0,0)
var velocitat = 200
var gravetat := Vector2.DOWN * 980
var ajupit := false
var atac := false


func _process(delta):
	direccio = Vector2(0,0)
	velocity.x = 100

	if Input.is_action_just_pressed("saltar") and is_on_floor():
		salta(400)
	if Input.is_action_just_pressed("ajupir-se") and is_on_floor():
		ajupte()
	if Input.is_action_just_pressed("Atac") and is_on_floor():
		cop_de_puny()

	
	velocity += gravetat * delta
	velocity +=  direccio.normalized() * velocitat
	move_and_slide()
	anima()

func anima():
	if not atac:
		if not ajupit:
			if velocity.y < 0:
				$Animacio.play('saltar')
			elif velocity.y > 0:
				$Animacio.play('saltar')
			elif velocity.x > 0:
				$Animacio.play('correr')
		else:
			$Animacio.play("ajup-te")
	else:
		$Animacio.play("atac")
func ajupte():
	ajupit = true
	$FormaAjupit.set_deferred("disabled", false)
	$FormaDret.set_deferred("disabled", true)
	
func aixecat():
	ajupit = false
	$FormaAjupit.set_deferred("disabled", true)
	$FormaDret.set_deferred("disabled", false)

	


func _on_animacio_animation_finished():
	if $Animacio.animation == "ajup-te":
		aixecat()
	elif $Animacio.animation == "atac":
		atac = false

func cop_de_puny():
	atac = true
	$AreaPuny.set_deferred("monitoring", true)
	$AreaPuny.set_deferred("monitoring", false)

	

func salta(intensitat):
	velocity += Vector2.UP * intensitat 



func _on_area_puny_area_entered(barril):
	print("ha tocat")
	barril.explota()
