import 'package:digiguard/constants/data_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late final SharedPreferences localStorage;

  static Future<void> initializeLocalStorage() async {
    localStorage = await SharedPreferences.getInstance();
  }

  static String getCurrentLevelId() {
    return localStorage.getString(DataConstants.levelKey) ??
        DataConstants.initialLevelId;
  }

  static void setCurrentLevelId(String currentLevelId) {
    localStorage.setString(DataConstants.levelKey, currentLevelId);
  }
}
