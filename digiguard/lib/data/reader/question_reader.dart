import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:digiguard/constants/data_constants.dart';
import 'package:digiguard/data/reader/level_reader.dart';
import 'package:digiguard/model/question.dart';
import 'package:flutter/services.dart';

class QuestionReader {
  static late List<Question> questionData;

  static Future<void> initQuestionData(Locale locale, String levelId) async {
    if (LevelReader.isFinalLevel(levelId)) {
      final allLevelIds = LevelReader.getAllLevelIds();
      levelId = allLevelIds.elementAt(Random().nextInt(allLevelIds.length - 1));
    }

    final jsonString = await rootBundle.loadString(
      "${DataConstants.assetRoot}/${locale.languageCode}/${DataConstants.questionDataRoot}/$levelId.json",
    );
    List<dynamic> questionDataJson = json.decode(jsonString);

    questionData = questionDataJson
        .map((questionData) => Question.fromJson(questionData))
        .toList();
  }

  static List<Question> getAllQuestions() {
    return questionData;
  }
}
