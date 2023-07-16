import 'dart:collection';

import 'package:digiguard/constants/data_constants.dart';
import 'package:digiguard/data/reader/level_reader.dart';
import 'package:flutter/material.dart';

class ImageReader {
  static final Map<String, Image> _levelImages = HashMap();

  static Future<void> initImages() async {
    for (final levelId in LevelReader.getAllLevelIds()) {
      _levelImages[levelId] = Image.asset(
        "${DataConstants.assetRoot}/${DataConstants.imageDataRoot}/$levelId.png",
      );
    }
  }

  static Image getImage(String levelId) {
    return _levelImages[levelId]!;
  }
}
