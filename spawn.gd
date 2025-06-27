extends Node3D

func _ready() -> void:
	#var coinsp = load("res://coin.tscn")
	#var coincopy = coinsp.instance()
	#add_child(coincopy)
	pass

func _process(delta: float):
	pass
	
func spawn_coin10():
	var coinsp10 = load("res://coin10.tscn")
	var coincopy10 = coinsp10.instantiate()
	add_child(coincopy10)
	
func spawn_coin100():
	var coinsp100 = load("res://coin100.tscn")
	var coincopy100 = coinsp100.instantiate()
	add_child(coincopy100)
	
func spawn_coin1000():
	var coinsp1000 = load("res://coin1000.tscn")
	var coincopy1000 = coinsp1000.instantiate()
	add_child(coincopy1000)
	

func _on_timer_timeout() -> void:
	
	var choice = randi() % 3 + 1
	
	match choice:
		1:
			spawn_coin10()
		2:
			spawn_coin100()
		3:
			spawn_coin1000()
