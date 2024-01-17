class_name BackendSqlite extends BackendBase


const verbosity_level : int = SQLite.VERBOSE

var db : SQLite = null


func _init() -> void:
	super()

	if BACKEND_CONFIG.is_empty():
		GodotLogger.error("Can't load Data Backend %s" % Global.env_database_backend)
		backend_initialized = false
		return


	db = SQLite.new()
	db.path = (DEBUG_DB_FILE_PATH if Global.env_debug else DEFAULT_DB_FILE_PATH) + BACKEND_CONFIG["SQLITE"]["DBFile"]
	db.verbosity_level = verbosity_level if BACKEND_CONFIG["SQLITE"]["verbosity"] == NAN else BACKEND_CONFIG["SQLITE"]["verbosity"]

	backend_initialized = create_backend_if_not_exists(Global.env_json_backend_file, {})


func create_backend_if_not_exists(_path: String, _json_data: Dictionary) -> bool:
	var table_dictionary: Dictionary = {}

	## check for dbfile
	## - create if needed
	var success = db.open_db()

	## check for database
	## - create if needed
	table_dictionary["id"] = {
	"data_type":"int",
	"primary_key": true,
	"auto_increment":true
	}

	## check for tabel(s)
	## - create if needed
	db.close_db()
	return success
