extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Handels button being pressed and quitting the game entirely
func _on_button_pressed():
	print("quit hit")
	get_tree().quit()
