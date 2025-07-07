extends CharacterBody3D

@export var health = PlayerVar.enemyhp
@export var hit_cooldown_active: bool = true
@export var killtimer: bool = true

func _ready() -> void:
	$Timer.start()

func _physics_process(delta: float) -> void:
	move_and_slide()
	if not is_on_floor():
		velocity += get_gravity() * delta

func _process(delta: float) -> void:
	if health == 0 and killtimer == true:
		$spawner.spawn_on_death()
		$spawner.spawn_on_death()
		$spawner.spawn_on_death()
		$spawner.spawn_on_death()
		$spawner.spawn_on_death()
		$spawner.spawn_on_death()
		$spawner.spawn_on_death()
		$spawner.spawn_on_death()
		$spawner.spawn_on_death()
		$spawner.spawn_on_death()
		$Timer2.start()
		killtimer = false
		
func _on_timer_2_timeout() -> void:
	PlayerVar.enemyhp = 4
	queue_free()

func _on_timer_timeout() -> void:
	hit_cooldown_active = false


func _on_area_3d_area_shape_entered(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int) -> void:
	if hit_cooldown_active == false:
		health -= 1
		$AuxScene/AnimationTree.set("parameters/gethit/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
		hit_cooldown_active = true
		$Timer.start()
		
