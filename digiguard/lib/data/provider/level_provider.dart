import 'package:digiguard/data/reader/level_reader.dart';
import 'package:digiguard/data/storage/local_storage.dart';
import 'package:digiguard/model/level.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LevelProvider extends StateNotifier<Level> {
  final List<Level> allLevels;
  int currentLevelIndex;

  LevelProvider(this.allLevels, this.currentLevelIndex)
      : super(allLevels.elementAt(currentLevelIndex));
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
