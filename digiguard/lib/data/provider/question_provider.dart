import 'package:digiguard/data/provider/level_provider.dart';
import 'package:digiguard/data/reader/question_reader.dart';
import 'package:digiguard/model/question.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionNotifier extends StateNotifier<Question> {
  final Ref ref;
  List<Question> _allQuestions;
  var _currentIndex = 0;

  QuestionNotifier(this._allQuestions, this.ref) : super(_allQuestions.first);

  Future<void> notifyQuestionAnswered() async {
    _currentIndex++;
    if (_allQuestions.length == _currentIndex) {
      await ref.read(levelProvider.notifier).notifyLevelIncrease();
      _allQuestions = QuestionReader.getAllQuestions();
      _currentIndex = 0;
    }

    state = _allQuestions[_currentIndex];
  }

  int getCurrentIndex() {
    return _currentIndex;
  }
}

final questionProvider = StateNotifierProvider<QuestionNotifier, Question>(
  (ref) {
    final allQuestions = QuestionReader.getAllQuestions();
    allQuestions.shuffle();

    return QuestionNotifier(allQuestions, ref);
  },
);
