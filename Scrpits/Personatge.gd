extends CharacterBody2D

var direccio := Vector2(0,0)
var velocitat = (200 + Global.ronda*10)
var gravetat := Vector2.DOWN * 980
var ajupit := false
var atac := false
var puja := false :
	set(nou_puja):
		puja = nou_puja

var monedes := 0:
	set(noves_monedes):
		monedes = noves_monedes
		Global.Contador.text = "Monedes: " + str(monedes)
func recomenca():
	position = Vector2(87,575)


func _process(delta):
	if puja:
		velocity = Vector2.ZERO
		direccio = Vector2.UP
		velocitat = 100
	else:
		direccio = Vector2(0,0)
		if velocity.x < 100:
			velocity.x = 100


		if Input.is_action_just_pressed("saltar") and is_on_floor():
			salta(400,0)
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
		$AreaPuny.set_deferred("monitoring", false)
	
func cop_de_puny():
	atac = true
	$AreaPuny.set_deferred("monitoring", true)

func salta(intensitat, direccióX):
	velocity += Vector2.UP * intensitat + Vector2.RIGHT * direccióX 
	direccióX = 0
func _on_area_puny_body_entered(Barril):
	Barril.explota()

func _ready():
	velocity.x = 100
