import 'dart:convert';
import 'dart:ui';

import 'package:digiguard/constants/data_constants.dart';
import 'package:digiguard/model/level.dart';
import 'package:flutter/services.dart';

class LevelReader {
  static late List<Level> levelInfo;

  static Future<void> initLevelInfo(Locale locale) async {
    final jsonString = await rootBundle.loadString(
      "${DataConstants.assetRoot}/${locale.languageCode}/${DataConstants.levelInfoAssetFile}",
    );
    List<dynamic> levelInfoJson = json.decode(jsonString);

    levelInfo =
        levelInfoJson.map((levelData) => Level.fromJson(levelData)).toList();
  }

  static Level getLevel(String levelId) {
    return levelInfo.firstWhere((element) => element.id == levelId);
  }
}
