import 'package:digiguard/model/Question.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const dummyQuestion = Question(
  questionText:
      'Which of the following is a sign of secure communication protocol?',
  options: ['https', 'http', 'ftp', 'None of the above'],
  answerIndex: 0,
);

class QuestionNotifier extends StateNotifier<Question> {
  QuestionNotifier(super.state);
}

final questionProvider = StateNotifierProvider<QuestionNotifier, Question>(
  (ref) => QuestionNotifier(dummyQuestion),
);
