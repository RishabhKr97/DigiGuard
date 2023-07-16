import 'package:digiguard/data/provider/question_provider.dart';
import 'package:digiguard/ui/widget/quiz/quiz_options.dart';
import 'package:digiguard/ui/widget/quiz/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  void _onNextQuestionRequest(WidgetRef ref) {
    ref.read(questionProvider.notifier).notifyQuestionAnswered();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentQuestion = ref.watch(questionProvider);
    final currentQuestionNumber =
        ref.read(questionProvider.notifier).getCurrentIndex() + 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Time!'),
      ),
      body: Column(
        children: [
          QuizQuestion(
            questionText: currentQuestion.questionText,
            questionIndex: currentQuestionNumber,
          ),
          Expanded(
            child: QuizOptions(
              key: ObjectKey(currentQuestion),
              options: currentQuestion.options,
              correctOptionIndex: currentQuestion.answerIndex,
              onNextQuestionRequest: () => _onNextQuestionRequest(ref),
            ),
          ),
        ],
      ),
    );
  }
}
