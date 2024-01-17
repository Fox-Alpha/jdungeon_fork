class_name BackendBase extends Node

# TODO: globalise path
const DEFAULT_DB_FILE_PATH: String = "user://"
const DEBUG_DB_FILE_PATH: String = "res://"

var backend_initialized = false

var BACKEND_CONFIG: Dictionary = {}

func _init() -> void:
	#var _error = Global.load_database_env_variables()
	BACKEND_CONFIG = Global.env_backend_config


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
