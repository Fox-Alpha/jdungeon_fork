class_name BackendBase extends Node

var backend_initialized = false

var BACKEND_CONFIG=""

func _init() -> void:
	pass


func create_backend_if_not_exists(_path: String, _json_data: Dictionary) -> bool:
	return false


func CreateAccount(_username: String, _password: String) -> Dictionary:
	return {}


func AuthenticateUser(_username: String, _password: String) -> bool:
	return false


func StorePlayerData(_username: String, _data: Dictionary) -> bool:
	return false


func LoadPlayerData(_username: String) -> Dictionary:
	var dummy : Dictionary = {}
	return dummy
