extends CharacterBody3D
#var has_shovel = false

@export var inventory_data: InventoryData

signal toggle_inventory()


func _ready():
	set_meta("CharacterBody3D", 1)
	
const SPEED = 5.0
const JUMP_VELOCITY = 3
# Get the gravity from the project settings to be synced with RigidDynamicBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var neck: Node3D = $Neck
@onready var camera: Camera3D = $Neck/Camera3d
@onready var interact_ray: RayCast3D = $Neck/Camera3d/InteractRay

#func _unhandled_input(event: InputEvent) -> void:
#	if event is InputEventMouseButton:
#		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#	elif event.is_action_pressed("ui_cancel"):
#		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
#	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
#		if event is InputEventMouseMotion:
#			neck.rotate_y(-event.relative.x * 0.00)
#			camera.rotate_x(-event.relative.y * 0.00)
#			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(0), deg_to_rad(0))
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	if Input.is_action_just_pressed("inventory"):
		toggle_inventory.emit()
	if Input.is_action_just_pressed("interact"):
		print ("interacted w/ chest")
		interact()
		
		
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		$soldier/AnimationPlayer.play("forward_walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		$soldier/AnimationPlayer.play("idle")
	
	move_and_slide()

func interact()-> void:
	print("Hey")
	if interact_ray.is_colliding():
		interact_ray.get_collider().player_interact
		print ("collider")
		
