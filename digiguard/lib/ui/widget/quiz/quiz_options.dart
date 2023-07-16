import 'package:digiguard/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class QuizOptions extends StatefulWidget {
  const QuizOptions({
    super.key,
    required this.options,
    required this.correctOptionIndex,
    required this.onNextQuestionRequest,
  });

  final List<String> options;
  final int correctOptionIndex;
  final void Function() onNextQuestionRequest;

  @override
  State<QuizOptions> createState() => _QuizOptionsState();
}

class _QuizOptionsState extends State<QuizOptions> {
  late bool _isAnsweredSelected;
  late bool _isAnsweredCorrectly;
  late int _selectedOptionIndex;

  @override
  void initState() {
    super.initState();
    _isAnsweredSelected = false;
  }

  void _onSelectOption(int index, bool isCorrect) {
    setState(() {
      _isAnsweredSelected = true;
      _isAnsweredCorrectly = isCorrect;
      _selectedOptionIndex = index;
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
                onPressed: widget.onNextQuestionRequest,
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
