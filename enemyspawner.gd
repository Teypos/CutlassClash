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
