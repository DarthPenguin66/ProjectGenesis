extends Area2D

var inputs = {"keyboard_right": Vector2.RIGHT,
			"keyboard_left": Vector2.LEFT,
			"keyboard_up": Vector2.UP,
			"keyboard_down": Vector2.DOWN,}

@onready var ray = $RayCast2D
@onready var facingDirection = Vector2.ZERO
var tile_size = 16
var animation_speed = 5
var moving = false

func move(dir):
	ray.target_position = dir * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		#position += inputs[dir] * tile_size
		var tween = create_tween()
		tween.tween_property(self, "position",
			position + dir * tile_size, 1.0/animation_speed).set_trans(Tween.TRANS_SINE)
		moving = true
		await tween.finished
		moving = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2
	pass # Replace with function body.
	

func interactPressed():
	ray.target_position = facingDirection * tile_size

@export var speed = 400 #speed in pixels per frame
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moving:
		return

	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("keyboard_right"):
		velocity.x += 1
		#print("right Pressed")
	if Input.is_action_pressed("keyboard_left"):
		velocity.x -= 1
		#print("left Pressed")
	if Input.is_action_pressed("keyboard_down"):
		velocity.y += 1
		#print("down Pressed")
	if Input.is_action_pressed("keyboard_up"):
		velocity.y -= 1
		#print("up Pressed")
	'''
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	'''

	if velocity.length() > 0:
		move(velocity)
		facingDirection = velocity
	for dir in inputs.keys():
		if Input.is_action_pressed(dir):
			print(dir)
		
	#position = position + velocity * delta
	pass
