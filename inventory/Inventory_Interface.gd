extends Control

@onready var player_inventory: PanelContainer = $PlayerInventory
@onready var inventory_interface: Control = $UI/InventoryInterface #trying to get 2ui from it's own node

func set_player_inventory_data(inventory_data: InventoryData) -> void:
	player_inventory.set_inventory_data(inventory_data)
