extends CanvasLayer
func _process(delta: float) -> void:	
	
	$Panel/Label.set_text(str(PlayerVar.money))
	
	
	match PlayerVar.health:
		8: 
			$Panel/TextureRect4.texture = ResourceLoader.load("res://hudstuff/heartfull.tres")
			$Panel/TextureRect3.texture = ResourceLoader.load("res://hudstuff/heartfull.tres")
			$Panel/TextureRect2.texture = ResourceLoader.load("res://hudstuff/heartfull.tres")
			$Panel/TextureRect.texture = ResourceLoader.load("res://hudstuff/heartfull.tres")
		7: 
			$Panel/TextureRect4.texture = ResourceLoader.load("res://hudstuff/hearthalf.tres")
			$Panel/TextureRect3.texture = ResourceLoader.load("res://hudstuff/heartfull.tres")
			$Panel/TextureRect2.texture = ResourceLoader.load("res://hudstuff/heartfull.tres")
			$Panel/TextureRect.texture = ResourceLoader.load("res://hudstuff/heartfull.tres")
		6: 
			$Panel/TextureRect4.texture = ResourceLoader.load("res://hudstuff/heartempty.tres")
			$Panel/TextureRect3.texture = ResourceLoader.load("res://hudstuff/heartfull.tres")
			$Panel/TextureRect2.texture = ResourceLoader.load("res://hudstuff/heartfull.tres")
			$Panel/TextureRect.texture = ResourceLoader.load("res://hudstuff/heartfull.tres")
		5: 
			$Panel/TextureRect4.texture = ResourceLoader.load("res://hudstuff/heartempty.tres")
			$Panel/TextureRect3.texture = ResourceLoader.load("res://hudstuff/hearthalf.tres")
			$Panel/TextureRect2.texture = ResourceLoader.load("res://hudstuff/heartfull.tres")
			$Panel/TextureRect.texture = ResourceLoader.load("res://hudstuff/heartfull.tres")
		4: 
			$Panel/TextureRect4.texture = ResourceLoader.load("res://hudstuff/heartempty.tres")
			$Panel/TextureRect3.texture = ResourceLoader.load("res://hudstuff/heartempty.tres")
			$Panel/TextureRect2.texture = ResourceLoader.load("res://hudstuff/heartfull.tres")
			$Panel/TextureRect.texture = ResourceLoader.load("res://hudstuff/heartfull.tres")
		3: 
			$Panel/TextureRect4.texture = ResourceLoader.load("res://hudstuff/heartempty.tres")
			$Panel/TextureRect3.texture = ResourceLoader.load("res://hudstuff/heartempty.tres")
			$Panel/TextureRect2.texture = ResourceLoader.load("res://hudstuff/hearthalf.tres")
			$Panel/TextureRect.texture = ResourceLoader.load("res://hudstuff/heartfull.tres")
		2: 
			$Panel/TextureRect4.texture = ResourceLoader.load("res://hudstuff/heartempty.tres")
			$Panel/TextureRect3.texture = ResourceLoader.load("res://hudstuff/heartempty.tres")
			$Panel/TextureRect2.texture = ResourceLoader.load("res://hudstuff/heartempty.tres")
			$Panel/TextureRect.texture = ResourceLoader.load("res://hudstuff/heartfull.tres")
		1: 
			$Panel/TextureRect4.texture = ResourceLoader.load("res://hudstuff/heartempty.tres")
			$Panel/TextureRect3.texture = ResourceLoader.load("res://hudstuff/heartempty.tres")
			$Panel/TextureRect2.texture = ResourceLoader.load("res://hudstuff/heartempty.tres")
			$Panel/TextureRect.texture = ResourceLoader.load("res://hudstuff/hearthalf.tres")
		0:
			$Panel/TextureRect4.texture = ResourceLoader.load("res://hudstuff/heartempty.tres")
			$Panel/TextureRect3.texture = ResourceLoader.load("res://hudstuff/heartempty.tres")
			$Panel/TextureRect2.texture = ResourceLoader.load("res://hudstuff/heartempty.tres")
			$Panel/TextureRect.texture = ResourceLoader.load("res://hudstuff/heartempty.tres")
			
			
			
#			#old
			#$Panel/TextureRect4.visible = false
			#$Panel/TextureRect3.visible = false
			#$Panel/TextureRect2.visible = false
			#$Panel/TextureRect.flip_h = true
		
