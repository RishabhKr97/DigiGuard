import 'package:digiguard/constants/data_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionIndexNotifier extends StateNotifier<int> {
  QuestionIndexNotifier(super.state);

  void resetIndex() {
    state = DataConstants.initialQuestionIndex;
  }

  void incrementIndex() {
    state++;
  }
}

final questionIndexProvider = StateNotifierProvider<QuestionIndexNotifier, int>(
  (ref) => QuestionIndexNotifier(
    DataConstants.initialQuestionIndex,
  ),
);
