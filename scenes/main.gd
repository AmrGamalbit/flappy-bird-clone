extends Node2D

var game_running : bool
var game_over : bool
var scroll
var score : int
const SCROLL_SPEED : int = 100
var screen_size : Vector2i
var ground_height : int
var pipes : Array
const PIPE_DELAY : int = 100
const PIPE_RANGE : int = 200

func _ready() -> void:
	screen_size = get_window().size
	new_game()
	
func new_game():
	game_running = false
	game_over = false
	score = 0
	scroll = 0
	$Bird.reset()
	
func _input(event: InputEvent) -> void:
	if game_over == false:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				if game_running == false:
					start_game()
				else:
					if $Bird.flying:
						$Bird.flap()

func start_game():
	game_running = true
	$Bird.flying = true
	$Bird.flap()

func _process(delta: float) -> void:
	if game_running: 
		scroll += SCROLL_SPEED * delta
		if scroll >= screen_size.x:
			scroll = 0 
		$Ground.position.x = -scroll
