extends Control

const Slot= preload("res://inventory.tscn")

@onready var item_grid: GridContainer = $PanelContainer/GridContainer

func _ready() -> void:
	var inv_data = preload(""
