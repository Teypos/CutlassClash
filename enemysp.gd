extends Node3D

func spawn_on_death():
	var choice = randi() % 2 + 1 
	var i = 0
	if i < 1000:
		match choice:
			1:
				if i < 1000:
					spawn_coin10()
					i = i + 10
			2:
				if i < 1000:
					spawn_coin100()
					i = i + 100
	else: 
		queue_free()
	
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
