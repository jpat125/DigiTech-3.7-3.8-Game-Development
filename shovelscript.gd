extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_entered(Area3Da):
	if Area3Da.name == "capsule_hitbox_a3d":
		var player = Area3Da.get_parent();
		player.get_parent().pick_up_item(player.Tools.Shovel)
		queue_free()

