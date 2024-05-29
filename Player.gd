extends Node2D

var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2(int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")),int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))).normalized()

	self.position += direction * speed * delta
