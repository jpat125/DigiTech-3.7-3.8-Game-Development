extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(15).timeout
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	


func _on_button_pressed():
	var intro_text = get_node("RichTextLabel")
	var continue_button = get_node("Button")
	intro_text.set_visible(false) 
	continue_button.set_visible(false)
