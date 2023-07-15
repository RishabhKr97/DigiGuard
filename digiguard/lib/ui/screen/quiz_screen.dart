import 'package:digiguard/data/provider/question_index_provider.dart';
import 'package:digiguard/data/provider/question_provider.dart';
import 'package:digiguard/ui/widget/quiz/quiz_options.dart';
import 'package:digiguard/ui/widget/quiz/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    final currentQuestion = ref.watch(questionProvider);
    final currentQuestionNumber = ref.read(questionIndexProvider) + 1;

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
              options: currentQuestion.options,
              correctOptionIndex: currentQuestion.answerIndex,
            ),
          ),
        ],
      ),
    );
  }
}
