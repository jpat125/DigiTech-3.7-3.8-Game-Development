extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_meta("Shovel", 1)
	var player = get_tree().get_root().get_node("Node3D/CharacterBody3D")
	player.set_meta("has_shovel", 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_entered(area):
	print("sure")
	if area.name == "capsule_hitbox_a3d":
		queue_free()

