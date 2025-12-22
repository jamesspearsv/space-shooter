extends RigidBody2D

signal ememy_hit
@export var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	linear_velocity = Vector2.DOWN * speed
	pass # Replace with function body.


## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(delta: float) -> void:
	#var velocity = Vector2.DOWN
	#velocity = velocity * speed
	#position += velocity * delta


func _on_body_entered(body: Node) -> void:
	print('enemy hit!')
	emit_signal('ememy_hit')
	pass # Replace with function body.
