extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_area_entered(StaticBody3D):
	if StaticBody3D.name == "capsule_hitbox_a3d" and BootlegGlobalVariable._shovel_status == 1:
		#var blocking_col_block = get_node("blocking")
		#blocking_col_block.set_disabled(true)
		#print(blocking_col_block.is_disabled())
		#var colobj3d_col_block = get_node("Area3D/CollisionShape3D")
		#colobj3d_col_block.set_disabled(true)
		#print(colobj3d_col_block.is_disabled())
		pass
		



func _on_tripcock_a_3d_area_entered(StaticBody3D):
	if StaticBody3D.name == "capsule_hitbox_a3d" and BootlegGlobalVariable._shovel_status == 1:
		$AnimationPlayer.play("rockfall_animation")
		print (BootlegGlobalVariable._shovel_status)
		#await get_tree().create_timer(5).timeout 
		#blocking_col_block.set_disabled(false)
		#colobj3d_col_block.set_disabled(false)
		var _has_shovel =  BootlegGlobalVariable._shovel_status
		BootlegGlobalVariable._shovel_status = 2
		print(BootlegGlobalVariable._shovel_status)
		
