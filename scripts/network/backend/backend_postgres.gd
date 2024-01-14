extends BackendBase

# .env
# Only required if backend is "postgres"
# POSTGRES_ADDRESS=127.0.0.1
# POSTGRES_PORT=5432
# POSTGRES_USER=testuser
# POSTGRES_PASSWORD=testpassword
# POSTGRES_DB=jdungeon

#var backen_initialized = false
const BACKEND_CONFIG={
	"POSTGRESS": {
		"Address": "127.0.0.1",
		"Port": 5432,
		"User": "testuser",
		"Passwd": "testpasswd",
		"DB": "jdungeon"
	}
}


func _init() -> void:
	pass
