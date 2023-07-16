import 'dart:convert';
import 'dart:ui';

import 'package:digiguard/constants/data_constants.dart';
import 'package:digiguard/model/level.dart';
import 'package:flutter/services.dart';

class LevelReader {
  static late final List<Level> _levelInfo;
  static late final List<String> _allLevelIds;

  static Future<void> initLevelInfo(Locale locale) async {
    final jsonString = await rootBundle.loadString(
      "${DataConstants.assetRoot}/${locale.languageCode}/${DataConstants.levelInfoAssetFile}",
    );
    List<dynamic> levelInfoJson = json.decode(jsonString);

    _levelInfo =
        levelInfoJson.map((levelData) => Level.fromJson(levelData)).toList();

    _allLevelIds = _levelInfo.map((level) => level.id).toList();
  }

  static List<Level> getAllLevels() {
    return _levelInfo;
  }

  static bool isFinalLevel(String levelId) {
    return _levelInfo.last.id == levelId;
  }

  static List<String> getAllLevelIds() {
    return _allLevelIds;
  }
}
