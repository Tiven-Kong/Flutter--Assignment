import 'package:flutter/material.dart';
import 'package:micro2/model/quiz.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({
    super.key,
    required this.question,
    required this.onAnswerSelected,
  });

  final Question question;
  final Function(String) onAnswerSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text("Question Screen"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                question.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...question.possibleAnswers.map(
                  (answer) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width:double.infinity,
                      child: ElevatedButton(

                                      onPressed: () {
                      onAnswerSelected(answer); // Pass selected answer
                                      },
                                      child: Text(answer),
                                    ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
