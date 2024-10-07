extends Area2D


@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("you died")
	timer.start() # Cuando el jugador entra en la killzone, se activa el timer

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene() 
	# Cuando el timer se termina, entra en esta función que reinicia la escena
