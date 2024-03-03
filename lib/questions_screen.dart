import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestinsScreen extends StatefulWidget {
  const QuestinsScreen({super.key});

  @override
  State<QuestinsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestinsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.outfit(
                color: const Color.fromARGB(255, 255, 230, 193),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffleAnswers().map((answer) {
              return Container(
                margin: const EdgeInsets.all(5),
                child: AnswerButton(
                  answerText: answer,
                  onTap: answerQuestion,
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
