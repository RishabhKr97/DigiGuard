import 'package:digiguard/Model/Question.dart';
import 'package:digiguard/UI/Widget/Quiz/quiz_options.dart';
import 'package:digiguard/UI/Widget/Quiz/quiz_question.dart';
import 'package:flutter/material.dart';

const Question dummyQuestion = Question(
  questionText:
      'Which of the following is a sign of secure communication protocol?.',
  options: ['https', 'http', 'ftp', 'None of the above'],
  answerIndex: 0,
);

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Time!'),
      ),
      body: Column(
        children: [
          QuizQuestion(
            questionText: dummyQuestion.questionText,
            questionIndex: 1,
          ),
          Expanded(child: QuizOptions(options: dummyQuestion.options)),
        ],
      ),
    );
  }
}
