extends Node3D
#var sens=2
signal set_cam_rotation(_cam_rotation : float)
@onready var cam_target_camera3d = $cam_target
@onready var pitch_camera3d = $cam_target/Pitch
@onready var camera = $cam_target/Pitch/SpringArm3D/Camera3D

var cam_target : float=0
var pitch : float=0

var cam_target_sens : float=0.1
var pitch_sens : float=0.1

var cam_target_accel : float=1
var pitch_accel : float=1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		cam_target += -event.relative.x * cam_target_sens
		pitch += -event.relative.y * pitch_sens
		
		

func _physics_process(delta: float) -> void:
	#cam_target_camera3d.rotation_degrees.y = lerp(cam_target_camera3d.rotation_degrees.y, cam_target, cam_target_accel * delta)
	#pitch_camera3d.rotation_degrees.x = lerp(pitch_camera3d.rotation_degrees.x, pitch, pitch_accel * delta)
	
	cam_target_camera3d.rotation_degrees.y = cam_target
	pitch_camera3d.rotation_degrees.x = pitch
	
	set_cam_rotation.emit(cam_target_camera3d.rotation.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
