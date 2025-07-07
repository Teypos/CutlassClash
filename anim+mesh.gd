class_name charanim extends Node3D

@export var attackable: bool = true

func _process(delta: float) -> void:
	print(PlayerVar.enemyhp)


func _on_hitbox_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if attackable == true and PlayerVar.enemyhp > 0:
		print("yes")
		PlayerVar.enemyhp -= 1
		attackable = false
		$atkcooldown.start()


func _on_attack_cooldown_timeout() -> void:
	attackable = true
