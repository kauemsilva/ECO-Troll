extends Area2D

var ativada = false

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Jogador" and not ativada:
		ativada = true
		# Torna o Sprite2D visivel na hora do susto!
		get_node("Sprite2D").visible = true
		await get_tree().create_timer(0.25).timeout
		Global.perder_vida()
		ativada = false
