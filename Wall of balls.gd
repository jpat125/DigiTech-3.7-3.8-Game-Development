extends Node3D

var _has_shovel =  BootlegGlobalVariable._shovel_status
# Called when the node enters the scene tree for the first time.
func _ready():
	set_meta("Wall", 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(Area3Da):
	if Area3Da.name == "capsule_hitbox_a3d" and _has_shovel == 1:
		queue_free()
