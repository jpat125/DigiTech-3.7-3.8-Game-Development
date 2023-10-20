extends StaticBody3D

signal toggle_inventory(external_inventory_owner)

@export var inventory_data: InventoryData


# code for chest 
func player_interact() -> void:
	toggle_inventory.emit(self)
