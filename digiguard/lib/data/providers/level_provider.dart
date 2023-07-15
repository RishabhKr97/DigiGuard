import 'package:digiguard/model/level.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const dummyLevel = Level(
  id: "level_1",
  name: "Beginner",
  description: "You are a beginner",
  rank: 0,
);

class LevelProvider extends StateNotifier<Level> {
  LevelProvider(super.state);
}

final levelProvider = StateNotifierProvider<LevelProvider, Level>(
  (ref) => LevelProvider(dummyLevel),
);
