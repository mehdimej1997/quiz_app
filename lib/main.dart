import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

test() {}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
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
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Image(
                  image: AssetImage("assets/images/quiz-logo.png"),
                  width: 200,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Learn Flutter the fun way!",
                  style: TextStyle(color: Colors.white60, fontSize: 22),
                ),
                const SizedBox(
                  height: 30,
                ),
                OutlinedButton(
                  onPressed: test,
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white70,
                      backgroundColor: Colors.amber.shade900),
                  child: const Text(
                    "Start Quiz",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
