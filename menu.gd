extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# start button - handles button being pressed and switches to game  
func _on_button_pressed():
	get_tree().change_scene_to_file("res://corridor_testing.tscn")


# Handles button being pressed and switches to credits page 
func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://credits_scene.tscn")

# Handles button being pressed and switches to controls page
func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://controls_HTP.tscn")
