import 'package:bearvoca/screens/quiz/quizData.dart';
import 'package:flutter/material.dart';

enum QUIZ_STATE {
  NONE,
  CORRECT,
  NOT_CORRECT,
}

// you can use ChangeNotifier to show new UI like LiveData in android
// add notifier at root(or specific position) and use Consumer() in child
class QuizNotifier extends ChangeNotifier {

  int iCurQuizIdx = 0;
  QUIZ_STATE eCurQuizState = QUIZ_STATE.NONE;
  QuizDataDAO quizDao = QuizDataDAO("testAddress");

  // QUIZ_CHOICE
  int iSelectedIdx = -1;

  // QUIZ_INPUT
  String strInput = "";

  void _resetQuizState() {
    eCurQuizState = QUIZ_STATE.NONE;
    iSelectedIdx = -1;
    strInput = "";
  }

  bool _isValidIdx() {
    return iCurQuizIdx >= 0 && iCurQuizIdx < quizDao.getQuizSize();
  }

  void notifyDataSetChanged() {
    notifyListeners();
  }

  void _saveQuizState() {
    if(!_isValidIdx() || quizDao.arrQuiz[iCurQuizIdx].eQuizType == QUIZ_TYPE.none) {
      return;
    }

    /* arrData에 퀴즈를 풀었는지 여부, 퀴즈 정답 여부를 가지고 있어야 하는 거 아닌가?
      => 가지고 있어야 편함.
    *
    * */

    if(quizDao.arrQuiz[iCurQuizIdx].eQuizType == QUIZ_TYPE.input) {
      quizDao.getQuizInput(iCurQuizIdx).strInput = strInput;
    }
    else {
      quizDao.getQuizChoice(iCurQuizIdx).iSelectedIdx = iSelectedIdx;
    }
  }

  void changeQuiz(bool isNext) {
    if(isNext) {

      if((iCurQuizIdx < quizDao.getQuizSize() - 1)) {
        ++iCurQuizIdx;
        _resetQuizState();
        notifyDataSetChanged();
      }
      else {
        // end event
      }

    }
    else if(!isNext) {

      if((iCurQuizIdx > 0)) {
        --iCurQuizIdx;
        _resetQuizState();
        notifyDataSetChanged();
      }
      else {
        // ignore this step
      }

    }
  }


  void checkAnswer() {
    if(!_isValidIdx()) {
      return;
    }
    else if(quizDao.arrQuiz[iCurQuizIdx].eQuizType == QUIZ_TYPE.none) {
      return;
    }

    if(quizDao.arrQuiz[iCurQuizIdx].eQuizType == QUIZ_TYPE.input) {
      quizDao.getQuizInput(iCurQuizIdx).strAnswer;
    }
    else {

    }



  }

}