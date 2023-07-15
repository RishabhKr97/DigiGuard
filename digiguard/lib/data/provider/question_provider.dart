import 'package:digiguard/constants/data_constants.dart';
import 'package:digiguard/data/reader/question_reader.dart';
import 'package:digiguard/model/question.dart';
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
  (ref) => QuestionNotifier(
    QuestionReader.getQuestion(DataConstants.initialQuestionIndex),
  ),
);
