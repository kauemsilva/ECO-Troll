extends Node

var vidas_maximas: int = 15
var vidas_atuais: int = vidas_maximas
var indestrutivel: bool = false
const SAVE_PATH = "user://save_game.dat"

func _ready():
	await get_tree().process_frame
	carregar_jogo()

func perder_vida():
	if indestrutivel:
		return
	vidas_atuais -= 1
	if vidas_atuais <= 0:
		game_over()
	else:
		get_tree().reload_current_scene()

func ativar_modo_turbo(duracao: float):
	indestrutivel = true
	await get_tree().create_timer(duracao).timeout
	indestrutivel = false

func game_over():
	vidas_atuais = vidas_maximas
	salvar_jogo("res://fase_1.tscn")
	get_tree().change_scene_to_file("res://game_over.tscn")

func avancar_fase(proxima_fase: String):
	salvar_jogo(proxima_fase)
	get_tree().change_scene_to_file(proxima_fase)

func salvar_jogo(fase_caminho: String):
	var arquivo = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if arquivo:
		var dados = {"fase": fase_caminho, "vidas": vidas_atuais}
		arquivo.store_string(JSON.stringify(dados))
		arquivo.close()

func carregar_jogo():
	if not FileAccess.file_exists(SAVE_PATH):
		return
	var arquivo = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if arquivo:
		var texto = arquivo.get_as_text()
		arquivo.close()
		var json = JSON.new()
		var erro = json.parse(texto)
		if erro == OK:
			var dados = json.get_data()
			vidas_atuais = int(dados.get("vidas", vidas_maximas))
			var fase_salva = dados.get("fase", "res://fase_1.tscn")
			if fase_salva != "res://fase_1.tscn":
				get_tree().change_scene_to_file(fase_salva)
