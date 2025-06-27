class_name charanim extends Node3D

func _process(delta: float) -> void:
	#$AnimationTree.advance(delta * 1000)
	pass
#func idle():
	#state_machine.travel("Idle")


func _on_cooldown_timer_timeout() -> void:
	pass # Replace with function body.
