import 'package:flutter_riverpod/flutter_riverpod.dart';

const _initialQuestionIndex = 1;

class QuestionIndexNotifier extends StateNotifier<int> {
  QuestionIndexNotifier(super.state);

  void resetIndex() {
    state = _initialQuestionIndex;
  }

  void incrementIndex() {
    state++;
  }
}

final questionIndexProvider = StateNotifierProvider<QuestionIndexNotifier, int>(
  (ref) => QuestionIndexNotifier(_initialQuestionIndex),
);
