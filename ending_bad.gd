extends Control


var pargraph = ("[center][b]Mission Failed![/b]

You have falled to collect all top secret documents, and they have fallen into the public domain. 

You'll now have to answer to an inquiry and have created one massive scandal!
") 


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in pargraph:
		$RichTextLabel.text +=i
		await get_tree().create_timer(0.1).timeout 
	$AnimationPlayer.play("transition")
	#await get_tree().create_timer(15).timeout 
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
