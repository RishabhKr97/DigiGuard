import 'package:digiguard/data/reader/level_reader.dart';
import 'package:digiguard/data/storage/local_storage.dart';
import 'package:digiguard/model/level.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LevelProvider extends StateNotifier<Level> {
  LevelProvider(super.state);
}

final levelProvider = StateNotifierProvider<LevelProvider, Level>(
  (ref) => LevelProvider(
    LevelReader.getLevel(
      LocalStorage.getCurrentLevelId(),
    ),
  ),
);
