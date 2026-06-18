extends CanvasLayer

func _process(_delta):
	$Label.text = "Vidas: " + str(Global.vidas_atuais)