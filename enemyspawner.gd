extends Node3D

func _ready() -> void:
	#var coinsp = load("res://coin.tscn")
	#var coincopy = coinsp.instance()
	#add_child(coincopy)
	pass

func _process(delta: float):
	pass
	
	
	
	
func spawn_enemy():
	var enemy = load("res://enemy.tscn")
	var enemycopy = enemy.instantiate()
	add_child(enemycopy)
	
func _on_timer_timeout() -> void:
	spawn_enemy()


func _on_area_3d_area_shape_entered(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int) -> void:
	var other_shape_owner = area.shape_find_owner(area_shape_index)
	var other_shape_node = area.shape_owner_get_owner(other_shape_owner)
	if other_shape_node.is_in_group("hitbox"):
		$Timer.start(120)
	if other_shape_node.is_in_group("collect"):
		$Timer.start(5)
		
func _on_area_3d_area_shape_exited(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int) -> void:
		$Timer.start(5)
