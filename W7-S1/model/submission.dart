import 'package:micro2/model/quiz.dart';

class Answer {
  String answer;
  String correctAnswer;

  Answer(this.answer, this.correctAnswer);

  bool isCorrect() {
    return answer == correctAnswer;
  }
}

class Submission {
  // Use a map to store answers for each question
  final Map<Question, Answer> answers = {};
  int score = 0;

  // Add an answer for a specific question
  void addAnswer(Question question, String answer) {
    answers[question] = Answer(answer, question.goodAnswer);
  }

  // Get the score based on correct answers
  int getScore() {
    score = 0;
    answers.forEach((question, answer) {
      if (answer.isCorrect()) {
        score++;
      }
    });
    return score;
  }

  // Get the user's answer for a specific question
  Answer? getAnswerFor(Question question) {
    return answers[question];
  }

  // Remove an answer for a specific question
  void removeAnswer(Question question) {
    answers.remove(question);
  }
}
