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
}
