extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var dialogue = get_node("Control")
	dialogue.set_visible(false)



# code for tripcock collision object, triggers animaion and triggers dialouge.
func _on_tripcock_a_3d_area_entered(StaticBody3D):
	
	if StaticBody3D.name == "capsule_hitbox_a3d" and BootlegGlobalVariable._shovel_status == 1:
		$AnimationPlayer.play("rockfall_animation")
		print (BootlegGlobalVariable._shovel_status)
		#await get_tree().create_timer(5).timeout 
		#blocking_col_block.set_disabled(false)
		#colobj3d_col_block.set_disabled(false)
		var _has_shovel =  BootlegGlobalVariable._shovel_status
		BootlegGlobalVariable._shovel_status = 1
		print(BootlegGlobalVariable._shovel_status)
		await get_tree().create_timer(3).timeout 
		var dialogue = get_node("Control")
		dialogue.set_visible(true)
		$tripcock_a3d.queue_free() 
		
		
