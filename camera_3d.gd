extends Node3D
#var sens=2
signal set_cam_rotation(_cam_rotation : float)
@onready var yaw_camera3d = $Yaw
@onready var pitch_camera3d = $Yaw/Pitch
@onready var camera = $Pitch/Camera3D

var yaw : float=0
var pitch : float=0

var yaw_sens : float=0.1
var pitch_sens : float=0.1

var yaw_accel : float=1
var pitch_accel : float=1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	#pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		yaw += -event.relative.x * yaw_sens
		pitch += -event.relative.y * pitch_sens
		
		

func _physics_process(delta: float) -> void:
	#yaw_camera3d.rotation_degrees.y = lerp(yaw_camera3d.rotation_degrees.y, yaw, yaw_accel * delta)
	#pitch_camera3d.rotation_degrees.x = lerp(pitch_camera3d.rotation_degrees.x, pitch, pitch_accel * delta)
	
	yaw_camera3d.rotation_degrees.y = yaw
	pitch_camera3d.rotation_degrees.x = pitch
	
	set_cam_rotation.emit(yaw_camera3d.rotation.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
