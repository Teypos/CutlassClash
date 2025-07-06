extends Node3D

@export var hit_cooldown_active: bool = false
@export var killtimer: bool = true
const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	pass

func _process(delta: float) -> void:
	if PlayerVar.enemyhp == 0:
		$spawner.spawn_on_death()

func _on_timer_timeout() -> void:
	hit_cooldown_active = false


func _on_area_3d_area_shape_entered(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int) -> void:
	if hit_cooldown_active == false:
		PlayerVar.enemyhp = PlayerVar.enemyhp - 1
		$AnimationTree.set("parameters/gethit/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
		hit_cooldown_active = true
		$Timer.start()
		
