import 'package:flutter/material.dart';
import 'package:quiz_app/data/quesions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String? activeScreen = "start-screen";
  final List<String> selectedAnswers = [];

  // @override
  // void initState() {
  //   activeScreen = StartScreen(onScreenChange);
  //   super.initState();
  // }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void onScreenChange() {
    setState(() {
      activeScreen = "question-screen";
      selectedAnswers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(onScreenChange);

    switch (activeScreen) {
      case "start-screen":
        screenWidget = StartScreen(onScreenChange);
        break;
      case "question-screen":
        screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
        break;
      case "result-screen":
        screenWidget = ResultScreen(
          selectedAnswers: selectedAnswers,
          onRestartQuiz: onScreenChange,
        );
        break;
      default:
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 86, 48, 151),
                Color.fromARGB(255, 109, 65, 187),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
