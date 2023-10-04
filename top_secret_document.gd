extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_meta("document", 1)
	var dialogue = get_node("Control")
	dialogue.set_visible(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_entered(Area3D):
	if Area3D.name == "capsule_hitbox_a3d": 
		var dialogue = get_node("Control")
		print("step before dialouge")
		dialogue.set_visible(true)
		await get_tree().create_timer(20).timeout
		print("123345") 
		queue_free()
