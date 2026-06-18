extends Area2D

@export var proxima_fase: String = "res://fase_1.tscn"

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Jogador":
		Global.avancar_fase(proxima_fase)
