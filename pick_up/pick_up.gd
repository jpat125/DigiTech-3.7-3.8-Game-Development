extends RigidBody3D

@export var slot_data: SlotData

@onready var sprite_3d: Sprite3D = $Sprite3D

func _ready() -> void:
	sprite_3d.texture = slot_data.item_data.texture
	
func _physics_process(delta: float) -> void:
	sprite_3d.rotate_y(delta)

# Handels pickup being colided with and changes slot_data vars
func _on_area_3d_body_entered(body:Node3D) -> void:
	if body.inventory_data.pick_up_slot_data(slot_data):
		
		queue_free()
	
