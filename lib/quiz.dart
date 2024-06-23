import 'package:flutter/material.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/question_screen.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> _selectAnswers = [];
  var _activeScreen = 'start-screen';

  void _switchScreen() {
    setState(() {
      _activeScreen = 'question-screen';
    });
  }

  void _chooseAnswer(String answer) {
    _selectAnswers.add(answer);

    if(_selectAnswers.length == questions.length){
      setState(() {
        _activeScreen = 'result-screen';
      });
    }
  }
  void restartQuiz() {
      setState(() {
        _selectAnswers=[];
        _activeScreen = 'question-screen';
      });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(_switchScreen);

    if (_activeScreen == 'question-screen') {
      screenWidget =  QuestionScreen(
        onSelectAnswer: _chooseAnswer,
      );
    }
    if(_activeScreen == 'result-screen'){
      screenWidget = ResultsScreen(
          chosenAnswers: _selectAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
