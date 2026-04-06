extends Node2D
@onready var score_label: Label = $CanvasLayer/ScorePanel/Score_Label

var score: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_setup_level()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
func _setup_level() -> void:
	var apples = $level_root.get_node_or_null("Apples")
	if apples:
		for enemy in apples.get_children():
			enemy.collected.connect(increase_score)
			
	var enemies = $level_root.get_node_or_null("Enemies")
	if enemies:
		for enemy in enemies.get_children():
			enemy.player_died.connect(_on_player_died)


func _on_player_died(body):
	body.die()
	print("Player killed")
	
	
func increase_score() -> void:
	score += 1
	score_label.text = "SCORE : %s" % score
		
