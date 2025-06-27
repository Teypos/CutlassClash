extends Node3D

@export var health = 10

const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	pass

func _process(delta: float) -> void:
	if health <=0:
		queue_free()
		


#func _on_area_3d_area_entered(area: Area3D) -> void:
	#health-=1
	#$AnimationTree.set("parameters/gethit/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	#$Timer.start()
	#health = clamp(health, health, health)

func _on_timer_timeout() -> void:
	
	pass # Replace with function body.
