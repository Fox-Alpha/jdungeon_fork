class_name LocalSaveSystem extends Object


static var SettingsPath: String = "SaveFile.ini" #if not Global.env_debug else DEBUG_SAVE_FILE_PATH
const DEFAULT_SAVE_FILE_PATH: String = "user://"
const DEBUG_SAVE_FILE_PATH: String = "res://"

const Sections: Dictionary = {SETTINGS = "SETTINGS"}

static var savedData := ConfigFile.new()

static func file_exists() -> bool:
	#if Global.env_debug:
	var _path = DEFAULT_SAVE_FILE_PATH if not Global.env_debug  else DEBUG_SAVE_FILE_PATH
	SettingsPath = "%s%s" % [_path, SettingsPath]
	return FileAccess.file_exists(SettingsPath)


static func save_file(path: String = SettingsPath):
	if not savedData is ConfigFile:
		savedData = ConfigFile.new()
	var errCode: int = savedData.save(path)
	if errCode != OK:
		GodotLogger.error(
			"Could not perform a local save. Error code {0} ({1})".format(
				[errCode, error_string(errCode)]
			)
		)

	return errCode


static func load_file(path: String = SettingsPath):
	var config := ConfigFile.new()
	var errCode: int = config.load(path)
	savedData = config
	if errCode != OK:
		GodotLogger.error(
			"Could not perform a local load. Error code {0} ({1})".format(
				[errCode, error_string(errCode)]
			)
		)

	return errCode


static func set_data(section: String, key: String, value):
	savedData.set_value(section, key, value)


static func get_data(section: String, key: String, default = null):
	return savedData.get_value(section, key, default)
