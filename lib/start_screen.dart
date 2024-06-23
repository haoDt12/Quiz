import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(150, 253, 241, 241),
        ),
        // Opacity(
        //   opacity: 0.6,
        //   child: Image.asset(
        //     'assets/images/quiz-logo.png',
        //     width: 300,
        //   ),
        // ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          'Learn Flutter the fin way!',
          style: TextStyle(
              color: Color.fromARGB(224, 255, 252, 252), fontSize: 25),
        ),
        const SizedBox(height: 40),
        OutlinedButton.icon(
          onPressed: () {
            startQuiz();
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white70,
          ),
          icon: const Icon(Icons.arrow_circle_right),
          label: const Text('Start Quiz'),
        )
      ]),
    );
  }
}
