extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var dialogue = get_node("Control")
	dialogue.set_visible(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_area_entered(Area):
	if Area.name == "capsule_hitbox_a3d":
		BootlegGlobalVariable._bunker_camera = 1
		print(BootlegGlobalVariable._bunker_camera)
		var dialogue = get_node("Control")
		dialogue.set_visible(true)
		await get_tree().create_timer(15).timeout
		print("Ending")
		# change scene to end cards
