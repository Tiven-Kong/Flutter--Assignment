import 'dart:io';

class Question {
  String questionText;
  List<String> options;
  List<int> correctAnswer;
  bool hasMultipleAnswers;

  Question(this.questionText, this.options, this.correctAnswer,
      {this.hasMultipleAnswers = false});
}

class Quiz {
  String firstName;
  String lastName;
  List<Question> questions;
  int score;
  Quiz(this.firstName, this.lastName, this.questions) : score = 0;
  void start() {
    for (var i = 0; i < questions.length; i++) {
      _askQuestion(questions[i], i);
    }
    _showScore();
  }

  void _askQuestion(Question question, int questionNumber) {
    stdout.write('\x1B[2J\x1B[0;0H'); // clear
    print("======================================");
    print("                Quiz                  ");
    print("======================================");
    print("Q${questionNumber + 1}: ${question.questionText}");
    print("--------------------------------------");
    question.options.forEach((option) => print(option));
    if (question.hasMultipleAnswers) {
      print("Note: This question has multiple correct answers.");
    }
    print("======================================\n");
    if (question.hasMultipleAnswers) {
      _getMultipleAnswers(question);
    } else {
      _getSingleAnswer(question);
    }
  }

  void _getMultipleAnswers(Question question) {
    String? input;
    while (true) {
      stdout.write("Enter your answers for Q (separate answers with spaces): ");
      input = stdin.readLineSync(); // get input
      if (input == null || input.isEmpty) {
        print("Invalid input! Please enter  number.");
        continue;
      } // if user click enter don't input value .

      List<int> userAnswers =
          input.split(' ').map(int.tryParse).whereType<int>().toList();
      if (userAnswers.isEmpty) {
        print("Invalid input! Please enter valid option numbers.");
        continue;
      }
      //if user input elemen

      if (Set.from(question.correctAnswer).containsAll(userAnswers) &&
          Set.from(userAnswers).containsAll(question.correctAnswer)) {
        score++;
      }
      break; // Exit the loop after processing the input
    }
  }

  void _getSingleAnswer(Question question) {
    int? answer;
    while (true) {
      stdout.write("Enter your answer for Q: ");
      String? input = stdin.readLineSync();
      if (input == null || input.isEmpty) {
        print("Invalid input! Please enter a number.");
        continue;
      }
      answer = int.tryParse(input);
      if (answer == null || answer < 1 || answer > question.options.length) {
        print(
            "Invalid answer! Please enter a valid option number (1-${question.options.length}).");
        continue;
      }
      if (question.correctAnswer.contains(answer)) {
        score++;
      }
      break; // Exit the loop after processing the input
    }
  }

  void _showScore() {
    stdout.write('\x1B[2J\x1B[0;0H');
    print(
        "Thank you, $firstName $lastName! Your score in this Quiz is $score out of ${questions.length}.");
  }
}

void main() {
  // Prompt for user's name
  stdout.write("Enter your First Name: ");
  String? firstName = stdin.readLineSync() ?? '';
  stdout.write("Enter your Last Name: ");
  String? lastName = stdin.readLineSync() ?? '';
  // Quiz questions
  List<Question> questions = [
    Question(
      "What is the capital of Cambodia?",
      ["1. Berlin", "2. Madrid", "3. Phnom Penh", "4. Rome"],
      [3],
    ),
    Question(
      "Which of the following are programming languages?",
      ["1. Python", "2. HTML", "3. CSS", "4. JavaScript"],
      [1, 4],
      hasMultipleAnswers: true,
    ),
    Question(
      "What is the largest mammal?",
      ["1. Elephant", "2. dog", "3. cat", "4. duck"],
      [1],
    ),
    Question(
      "Which of these are common web development languages?",
      ["1. SQL", "2. HTML", "3. CSS", "4. C++"],
      [2, 3],
      hasMultipleAnswers: true,
    ),
  ];
  // Create a Quiz instance
  Quiz quiz = Quiz(firstName, lastName, questions);
  quiz.start();
}
