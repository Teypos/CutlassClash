extends RigidBody3D

func _on_area_3d_area_entered(area: Area3D) -> void:
	PlayerVar.money = PlayerVar.money + 10
	queue_free()
