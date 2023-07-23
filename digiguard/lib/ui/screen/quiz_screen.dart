import 'package:digiguard/data/provider/level_provider.dart';
import 'package:digiguard/data/provider/question_provider.dart';
import 'package:digiguard/model/level.dart';
import 'package:digiguard/ui/widget/quiz/level_complete_dialog.dart';
import 'package:digiguard/ui/widget/quiz/quiz_options.dart';
import 'package:digiguard/ui/widget/quiz/quiz_question.dart';
import 'package:digiguard/ui/widget/quiz/rank.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  void _showLevelCompleteDialog(
      BuildContext context, Level prevLevel, Level newLevel) {
    showDialog(
      context: context,
      builder: (ctx) => LevelCompleteDialog(
        prevLevel: prevLevel,
        newLevel: newLevel,
      ),
    );
  }

  Future<void> _onNextQuestionRequest(
      BuildContext context, WidgetRef ref) async {
    Level currentLevel = ref.read(levelProvider);
    await ref.read(questionProvider.notifier).notifyQuestionAnswered();
    Level newLevel = ref.read(levelProvider);

    if (newLevel != currentLevel && context.mounted) {
      _showLevelCompleteDialog(context, currentLevel, ref.read(levelProvider));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentQuestion = ref.watch(questionProvider);
    final currentQuestionNumber =
        ref.read(questionProvider.notifier).getDisplayIndex();
    final currentLevel = ref.read(levelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Time!'),
      ),
      body: Column(
        children: [
          Rank(currentLevel),
          QuizQuestion(
            questionText: currentQuestion.questionText,
            questionIndex: currentQuestionNumber,
          ),
          Expanded(
            child: QuizOptions(
              key: ObjectKey(currentQuestion),
              options: currentQuestion.options,
              correctOptionIndex: currentQuestion.answerIndex,
              onNextQuestionRequest: () => _onNextQuestionRequest(context, ref),
            ),
          ),
        ],
      ),
    );
  }
}
