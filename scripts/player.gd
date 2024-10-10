extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0

func _physics_process(delta: float) -> void:
	# Agregar la gravedad.
	if not is_on_floor():
		velocity.y += ProjectSettings.get_setting("physics/2d/default_gravity") * delta

	# Manejar el salto.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Obtener la dirección de input y manejar el movimiento/desaceleración.
	# Como buena práctica, reemplaza las acciones de UI con acciones personalizadas para el juego.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
