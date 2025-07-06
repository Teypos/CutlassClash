extends CharacterBody3D

@export var health = 8
@export var money = 0
@export var enemyhp = 4

func _process(delta: float) -> void:
	clamp(health, 0, 8)
	clamp(money, 0, 0)
	clamp(enemyhp, 0, 8)
