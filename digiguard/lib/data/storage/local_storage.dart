import 'package:digiguard/data/storage/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late final SharedPreferences localStorage;

  static void initializeLocalStorage() async {
    localStorage = await SharedPreferences.getInstance();
  }

  static String getCurrentLevelId() {
    return localStorage.getString(StorageConstants.levelKey) ??
        StorageConstants.initialLevelId;
  }

  static void setCurrentLevelId(String currentLevelId) {
    localStorage.setString(StorageConstants.levelKey, currentLevelId);
  }
}
