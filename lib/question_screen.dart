import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/quesions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({required this.onSelectAnswer, super.key});

  final void Function(String) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.question,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...currentQuestion.shuffleAnswers().map(
                (answer) => AnswerButton(
                  answer,
                  () => answerQuestion(answer),
                ),
              ),
        ],
      ),
    );
  }
}
