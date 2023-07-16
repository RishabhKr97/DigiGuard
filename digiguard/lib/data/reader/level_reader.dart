import 'dart:convert';
import 'dart:ui';

import 'package:digiguard/constants/data_constants.dart';
import 'package:digiguard/model/level.dart';
import 'package:flutter/services.dart';

class LevelReader {
  static late final List<Level> levelInfo;
  static late final List<String> allLevelIds;

  static Future<void> initLevelInfo(Locale locale) async {
    final jsonString = await rootBundle.loadString(
      "${DataConstants.assetRoot}/${locale.languageCode}/${DataConstants.levelInfoAssetFile}",
    );
    List<dynamic> levelInfoJson = json.decode(jsonString);

    levelInfo =
        levelInfoJson.map((levelData) => Level.fromJson(levelData)).toList();

    allLevelIds = levelInfo.map((level) => level.id).toList();
  }

  static List<Level> getAllLevels() {
    return levelInfo;
  }

  static bool isFinalLevel(String levelId) {
    return levelInfo.last.id == levelId;
  }

  static List<String> getAllLevelIds() {
    return allLevelIds;
  }
}
