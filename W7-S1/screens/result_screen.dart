import 'package:flutter/material.dart';
import 'package:micro2/model/quiz.dart';
import 'package:micro2/model/submission.dart';
import 'package:micro2/screens/welcome_screen.dart'; // Import your WelcomeScreen

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final Submission submission;
  final VoidCallback onStartAgain; // Callback to handle restart

  ResultScreen({required this.quiz, required this.submission, required this.onStartAgain});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(title: Text('Result') , backgroundColor: Colors.blue,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Score: ${submission.getScore()} / ${quiz.questions.length}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Display each question and the answer
            Expanded(
              child: ListView.builder(
                itemCount: quiz.questions.length,
                itemBuilder: (context, index) {
                  final question = quiz.questions[index];
                  final answer = submission.getAnswerFor(question);

                  // Check if the answer is correct
                  bool isCorrect = answer != null && answer.isCorrect();

                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        // Display the question number
                        CircleAvatar(
                          child: Text(
                            'Q${index + 1}: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor:  isCorrect ? Colors.green : Colors.red,
                        ),
                        // Display the question text
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(question.title),
                              SizedBox(height: 5),
                              // Display the user's answer with color if it's correct or incorrect
                              Text(
                                'Your answer: ${answer?.answer }',
                                style: TextStyle(
                                  color: isCorrect ? Colors.green : Colors.red,
                                    fontWeight: FontWeight.bold , fontSize: 20
                                ),
                              ),
                              // Show the correct answer in green
                              if (answer != null && !isCorrect)
                                Text(
                                  'Correct answer: ${question.goodAnswer}',
                                  style: TextStyle(color: Colors.green , fontWeight: FontWeight.bold , fontSize: 20),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Start Again button
            Center(
              child: ElevatedButton(
                onPressed: onStartAgain, // Calls the onStartAgain callback to reset the state
                child: Text('Start Again'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Button color
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
