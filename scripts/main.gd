extends Node

@export var laser_scene: PackedScene
var laser_cooling_down: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PlayerShip.position = $StartingMarker.position
	print($PlayerShip.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("fire_laser"):
		if laser_cooling_down:
			pass
		else:	
			var laser = laser_scene.instantiate()
			laser.position = $PlayerShip.position
			$LaserCooldown.start()
			add_child(laser)
			laser_cooling_down = true  
		


func _on_laser_cooldown_timeout() -> void:
	laser_cooling_down = false
