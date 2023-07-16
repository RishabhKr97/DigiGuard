import 'package:digiguard/data/reader/question_reader.dart';
import 'package:digiguard/model/question.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionNotifier extends StateNotifier<Question> {
  final List<Question> _allQuestions;
  var _currentIndex = 0;

  QuestionNotifier(this._allQuestions) : super(_allQuestions.first);

  void notifyQuestionAnswered() {
    _currentIndex++;
    if (_allQuestions.length == _currentIndex) {
      return;
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

    return QuestionNotifier(allQuestions);
  },
);
