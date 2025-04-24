extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 6.6

@onready var cam_target = $cam_controller/cam_target
@onready var pitch = $cam_controller/cam_target/Pitch
@onready var camera3D = $cam_controller/cam_target/Pitch/Camera3D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (cam_target.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	$MeshInstance3D.rotation.y = lerp($MeshInstance3D.rotation.y, $cam_controller/cam_target.rotation.y, 0.06)

	#cam handle
	var camera_position = $cam_controller.position
	camera_position.x = lerp(camera_position.x, position.x, 0.1)
	camera_position.z = lerp(camera_position.z, position.z, 0.1)
	camera_position.y = lerp(camera_position.y, position.y, 0.05)
	$cam_controller.position = camera_position
	
	#$MeshInstance3D.rotation.y = lerp_angle( $MeshInstance3D.rotation.y, input_dir.angle(), 0.1)  
