extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PlayerShip.position = $StartingMarker.position
	print($PlayerShip.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
