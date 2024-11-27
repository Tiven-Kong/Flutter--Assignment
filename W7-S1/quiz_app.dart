import 'package:flutter/material.dart';
import 'package:micro2/screens/question_screen.dart';
import 'package:micro2/screens/welcome_screen.dart';
import 'package:micro2/screens/result_screen.dart';
import 'model/quiz.dart';
import 'model/submission.dart';

enum QuizState {
  notStarted,
  started,
  finished,
}

Color appColor = Colors.blue[500] as Color;

class QuizApp extends StatefulWidget {
  QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState currentState = QuizState.notStarted;
  int currentQuestionIndex = 0;

  // Track user answers
  final Submission submission = Submission();

  void start() {
    setState(() {
      currentState = QuizState.started;
    });
  }

  void restartQuiz() {
    setState(() {
      currentState = QuizState.notStarted; // Reset to not started state
      currentQuestionIndex = 0; // Reset the question index
      submission.answers.clear(); // Clear the previous answers
      submission.score = 0; // Reset the score
    });
  }

  void nextQuestion(String selectedAnswer) {
    setState(() {
      submission.addAnswer(
        widget.quiz.questions[currentQuestionIndex],
        selectedAnswer,
      );

      if (currentQuestionIndex < widget.quiz.questions.length - 1) {
        currentQuestionIndex++;
      } else {
        currentState = QuizState.finished;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          if (currentState == QuizState.notStarted) {
            return WelcomeScreen(welcome: start);
          } else if (currentState == QuizState.started) {
            return QuestionScreen(
              question: widget.quiz.questions[currentQuestionIndex],
              onAnswerSelected: (selectedAnswer) => nextQuestion(selectedAnswer),
            );
          } else {
            return ResultScreen(
              quiz: widget.quiz,
              submission: submission,
              onStartAgain: restartQuiz, // Pass the restart function
            );
          }
        },
      ),
    );
  }
}
