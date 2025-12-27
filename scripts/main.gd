extends Node

@export var laser_scene: PackedScene
@export var enemy_scene: PackedScene
var laser_cooling_down: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PlayerShip.position = $StartingMarker.position

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
		


func add_enemy_ship() -> void:
	var enemy_ship: RigidBody2D = enemy_scene.instantiate()
	var spawn_pos = $EnemyPath/EnemySpawnLocation
	spawn_pos.progress_ratio = randf()
	
	enemy_ship.linear_velocity = Vector2(0.0, randf_range(100.00, 400.00))
	
	enemy_ship.position = Vector2(spawn_pos.position.x, spawn_pos.position.y)
	enemy_ship.linear_velocity = Vector2.DOWN * 1000
	add_child(enemy_ship)


func _on_laser_cooldown_timeout() -> void:
	laser_cooling_down = false


func _on_enemy_spawn_timer_timeout() -> void:
	add_enemy_ship()
