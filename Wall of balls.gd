extends Node3D

var _has_shovel =  BootlegGlobalVariable._shovel_status

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func _on_area_entered(StaticBody3D):
	if StaticBody3D.name == "capsule_hitbox_a3d" and BootlegGlobalVariable._shovel_status == 1:
		print (BootlegGlobalVariable._shovel_status)
		
		queue_free()
