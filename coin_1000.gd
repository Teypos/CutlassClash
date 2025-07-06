extends RigidBody3D

func _on_area_3d_area_shape_entered(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int) -> void:
	var other_shape_owner = area.shape_find_owner(area_shape_index)
	var other_shape_node = area.shape_owner_get_owner(other_shape_owner)
	if other_shape_node.is_in_group("collect"):
		PlayerVar.money = PlayerVar.money + 1000
		queue_free()
