import 'package:digiguard/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class QuizQuestion extends StatelessWidget {
  const QuizQuestion({
    super.key,
    required this.questionText,
    required this.questionIndex,
  });

  final String questionText;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(UiConstants.quizWidgetsPadding),
      height: 250,
      child: Card(
        elevation: 0.4,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Center(
          child: ListTile(
            leading: Text(
              'Q$questionIndex',
            ),
            title: Text(
              questionText,
            ),
          ),
        ),
      ),
    );
  }
}
