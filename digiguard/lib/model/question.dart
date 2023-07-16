class Question {
  final String questionText;
  final List<String> options;
  final int answerIndex;

  const Question({
    required this.questionText,
    required this.options,
    required this.answerIndex,
  });

  Question.fromJson(Map<String, dynamic> json)
      : questionText = json['questionText'] as String,
        options = (json['options'] as List)
            .map(
              (value) => value as String,
            )
            .toList(),
        answerIndex = json['answerIndex'] as int;

  static Question shuffleOptions(final Question question) {
    final List<String> options = List.from(question.options);
    options.shuffle();
    final answerIndex = options.indexWhere(
        (option) => option == question.options.elementAt(question.answerIndex));

    return Question(
      questionText: question.questionText,
      options: options,
      answerIndex: answerIndex,
    );
  }
}
