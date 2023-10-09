extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_meta("Patch", 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_area_entered(Area3D):
	if Area3D.name == "capsule_hitbox_a3d": 
		queue_free()
