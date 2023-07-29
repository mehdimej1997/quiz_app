import 'package:flutter/material.dart';
import 'package:quiz_app/data/quesions.dart';
import 'package:quiz_app/result.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    required this.selectedAnswers,
    required this.onRestartQuiz,
    super.key,
  });

  final List<String> selectedAnswers;
  final void Function() onRestartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].question,
          'correct_answer': questions[i].answers[0],
          'user_answer': selectedAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final questionsLength = questions.length.toString();
    final correctAnswersLength = summaryData
        .where((element) => element["correct_answer"] == element["user_answer"])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You Answerd $correctAnswersLength out of $questionsLength correctly",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
          const SizedBox(height: 30),
          Result(summaryData: summaryData),
          const SizedBox(height: 30),
          TextButton.icon(
            onPressed: onRestartQuiz,
            icon: const Icon(Icons.restart_alt),
            label: const Text("Restart Quiz!"),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
