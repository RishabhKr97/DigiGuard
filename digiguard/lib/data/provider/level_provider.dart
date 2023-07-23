import 'package:digiguard/constants/ui_constants.dart';
import 'package:digiguard/data/reader/level_reader.dart';
import 'package:digiguard/data/reader/question_reader.dart';
import 'package:digiguard/data/storage/local_storage.dart';
import 'package:digiguard/model/level.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LevelProvider extends StateNotifier<Level> {
  final List<Level> allLevels;
  int _currentLevelIndex;

  LevelProvider(this.allLevels, this._currentLevelIndex)
      : super(allLevels.elementAt(_currentLevelIndex));

  Future<void> notifyLevelIncrease() async {
    if (!isLastLevel()) {
      _currentLevelIndex++;
    }

    final newLevelId = allLevels.elementAt(_currentLevelIndex).id;
    LocalStorage.setCurrentLevelId(newLevelId);
    await QuestionReader.initQuestionData(
        UiConstants.defaultLocale, newLevelId);
    state = allLevels[_currentLevelIndex];
  }

  bool isLastLevel() {
    return _currentLevelIndex == allLevels.length - 1;
  }
}

final levelProvider = StateNotifierProvider<LevelProvider, Level>(
  (ref) {
    final allLevels = LevelReader.getAllLevels();
    final currentLevelId = LocalStorage.getCurrentLevelId();
    final currentLevelIndex =
        allLevels.indexWhere((level) => level.id == currentLevelId);

    return LevelProvider(allLevels, currentLevelIndex);
  },
);
