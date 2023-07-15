import 'package:digiguard/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class QuizOptions extends StatefulWidget {
  const QuizOptions({
    super.key,
    required this.options,
    required this.correctOptionIndex,
  });

  final List<String> options;
  final int correctOptionIndex;

  @override
  State<QuizOptions> createState() => _QuizOptionsState();
}

class _QuizOptionsState extends State<QuizOptions> {
  bool _isAnsweredSelected = false;
  bool _isAnsweredCorrectly = false;
  int _selectedOptionIndex = -1;

  void _onSelectOption(int index, bool isCorrect) {
    _isAnsweredCorrectly = isCorrect;
    _selectedOptionIndex = index;
    setState(() {
      _isAnsweredSelected = true;
    });
  }

  Widget _getOptionLeadingWidget(int index) {
    if (!_isAnsweredSelected || index != _selectedOptionIndex) {
      return Text(String.fromCharCode(index + UiConstants.aCharCode));
    }

    final Icon leadingIcon;
    if (_isAnsweredCorrectly) {
      leadingIcon = Icon(
        Icons.check_circle_outline,
        color: Colors.green.shade900,
      );
    } else {
      leadingIcon = Icon(
        Icons.close,
        color: Colors.red.shade900,
      );
    }

    return leadingIcon;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(UiConstants.quizWidgetsPadding),
      child: ListView(
        primary: false,
        children: [
          for (int i = 0; i < widget.options.length; i++)
            Card(
              elevation: _isAnsweredSelected && i == _selectedOptionIndex
                  ? UiConstants.quizHighlightCardElevation
                  : UiConstants.quizDefaultCardElevation,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: ListTile(
                onTap: _isAnsweredSelected
                    ? null
                    : () => _onSelectOption(i, i == widget.correctOptionIndex),
                leading: _getOptionLeadingWidget(i),
                title: Text(
                  widget.options[i],
                ),
              ),
            ),
          if (_isAnsweredSelected)
            if (_isAnsweredCorrectly)
              IconButton(
                onPressed: () {
                  setState(() {
                    _isAnsweredSelected = false;
                  });
                },
                icon: Icon(
                  Icons.navigate_next,
                  size: UiConstants.quizResultNextButtonSize,
                  color: Colors.green.shade900,
                ),
              )
            else
              IconButton(
                onPressed: () {
                  setState(() {
                    _isAnsweredSelected = false;
                  });
                },
                icon: Icon(
                  Icons.replay,
                  size: UiConstants.quizResultRetryButtonSize,
                  color: Colors.red.shade900,
                ),
              )
        ],
      ),
    );
  }
}
