extends Panel
func _process(delta: float) -> void:
	
	match PlayerVar.health:
		8: 
			pass
		7: 
			$TextureRect1.visible = false
		6: 
			$TextureRect4.visible = false
		5: 
			$TextureRect4.visible = false
			$TextureRect3.flip.h = true
		4: 
			$TextureRect4.visible = false
			$TextureRect3.visible = false
		3: 
			$TextureRect4.flip.h = true
		2: 
			pass
		1: 
			$TextureRect4.flip.h = true
		
