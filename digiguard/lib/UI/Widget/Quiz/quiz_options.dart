import 'package:digiguard/ui/theme/style_constants.dart';
import 'package:flutter/material.dart';

class QuizOptions extends StatelessWidget {
  const QuizOptions({
    super.key,
    required this.options,
  });

  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(StyleConstants.quizWidgetsPadding),
      child: Column(
        children: [
          for (int i = 0; i < options.length; i++)
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: ListTile(
                onTap: () {},
                leading: Text(
                  String.fromCharCode(i + 65),
                ),
                title: Text(
                  options[i],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
