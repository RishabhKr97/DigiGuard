import 'package:digiguard/data/provider/level_provider.dart';
import 'package:digiguard/data/reader/question_reader.dart';
import 'package:digiguard/model/question.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionNotifier extends StateNotifier<Question> {
  final Ref ref;
  List<Question> _allQuestions;
  var _currentIndex = 0;
  var _displayIndex = 1;

  QuestionNotifier(this._allQuestions, this.ref)
      : super(Question.shuffleOptions(_allQuestions.first));

  Future<void> notifyQuestionAnswered() async {
    _currentIndex++;
    _displayIndex++;

    if (_allQuestions.length == _currentIndex) {
      if (!ref.read(levelProvider.notifier).isLastLevel()) {
        _displayIndex = 1;
      }

      await ref.read(levelProvider.notifier).notifyLevelIncrease();
      _allQuestions = QuestionReader.getAllQuestions();
      _allQuestions.shuffle();
      _currentIndex = 0;
    }

    state = Question.shuffleOptions(_allQuestions[_currentIndex]);
  }

  int getDisplayIndex() {
    return _displayIndex;
  }
}

final questionProvider = StateNotifierProvider<QuestionNotifier, Question>(
  (ref) {
    final allQuestions = QuestionReader.getAllQuestions();
    allQuestions.shuffle();

    return QuestionNotifier(allQuestions, ref);
  },
);
