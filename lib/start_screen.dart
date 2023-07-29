import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function() onSwitchScreen;
  const StartScreen(this.onSwitchScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Opacity(
            opacity: 0.7,
            child: Image(
              image: AssetImage("assets/images/quiz-logo.png"),
              width: 200,
            ),
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
          OutlinedButton.icon(
            onPressed: onSwitchScreen,
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white70,
                backgroundColor: Colors.amber.shade900),
            label: const Text(
              "Start Quiz",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
            icon: const Icon(Icons.arrow_right_alt),
          ),
        ],
      ),
    );
  }
}
