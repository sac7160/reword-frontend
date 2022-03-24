import 'package:bearvoca/screens/quiz/quizData.dart';
import 'package:flutter/material.dart';

import '../../util/AppFunc.dart';

enum QUIZ_STATE {
  none,
  correct,
  notCorrect,
}

// you can use ChangeNotifier to show new UI like LiveData in android
// add notifier at root(or specific position) and use Consumer() in child
class QuizNotifier extends ChangeNotifier {

  int iCurQuizIdx = 0;
  QUIZ_STATE eCurQuizState = QUIZ_STATE.none;
  QuizDataDAO quizDao = QuizDataDAO("testAddress");

  // QUIZ_CHOICE
  int iSelectedIdx = -1;

  // QUIZ_INPUT
  String strInput = "";

  void _setCurQuizState() {
    switch(quizDao.arrQuiz[iCurQuizIdx].eQuizType) {
      case QUIZ_TYPE.none: {
        eCurQuizState = QUIZ_STATE.none;
        iSelectedIdx = -1;
        strInput = "";
        break;
      }

      case QUIZ_TYPE.input: {
        QuizInputData quiz = quizDao.getQuizInput(iCurQuizIdx);
        iSelectedIdx = -1;
        eCurQuizState = quiz.eQuizState;
        strInput = quiz.strInput;
        break;
      }

      case QUIZ_TYPE.choiceKor:
      case QUIZ_TYPE.choiceEng: {
        QuizChoiceData quiz = quizDao.getQuizChoice(iCurQuizIdx);
        iSelectedIdx = quiz.iSelectedIdx;
        eCurQuizState = quiz.eQuizState;
        strInput = "";
        break;
      }
    }

  }

  String getChoiceFormAnswer(int iIdx) {
    if(!_isValidIdx() || iIdx < 0 || iIdx >= 3 || quizDao.arrQuiz[iCurQuizIdx].eQuizType == QUIZ_TYPE.none
        || quizDao.arrQuiz[iCurQuizIdx].eQuizType == QUIZ_TYPE.input) {
      return "";
    }

    return quizDao.getQuizChoice(iCurQuizIdx).arrAnswer[iIdx];
  }

  // check answer with state
  bool isQuizCorrect() {
    return eCurQuizState == QUIZ_STATE.correct;
  }

  bool isQuizNotCorrect() {
    return eCurQuizState == QUIZ_STATE.notCorrect;
  }

  // check answer with value
  bool isAnswerCorrect() {
    if(!_isValidIdx()) {
      return false;
    }

    switch(quizDao.arrQuiz[iCurQuizIdx].eQuizType) {
      case QUIZ_TYPE.none:
        return false;

      case QUIZ_TYPE.input:
        return _isCorrectInput();

      case QUIZ_TYPE.choiceKor:
      case QUIZ_TYPE.choiceEng:
        return _isCorrectChoice();
    }
  }

  // choiceForm only
  int getAnswerIdx() {
    if(!_isValidIdx() || quizDao.arrQuiz[iCurQuizIdx].eQuizType == QUIZ_TYPE.none
        || quizDao.arrQuiz[iCurQuizIdx].eQuizType == QUIZ_TYPE.input) {
      return -1;
    }

    return quizDao.getQuizChoice(iCurQuizIdx).iAnswerIdx;
  }

  // inputForm only
  String getAnswerString() {
    if(!_isValidIdx() || quizDao.arrQuiz[iCurQuizIdx].eQuizType != QUIZ_TYPE.input) {
      return "";
    }

    return quizDao.getQuizInput(iCurQuizIdx).strAnswer;
  }

  bool _isCorrectInput() {
    return quizDao.getQuizInput(iCurQuizIdx).strAnswer == strInput;
  }

  bool _isCorrectChoice() {
    if(iSelectedIdx == -1) {
      return false;
    }

    return quizDao.getQuizChoice(iCurQuizIdx).iAnswerIdx == iSelectedIdx;
  }

  bool _isValidIdx() {
    return iCurQuizIdx >= 0 && iCurQuizIdx < quizDao.getQuizSize();
  }

  void notifyDataSetChanged() {
    notifyListeners();
  }

  // check the result of a quiz and save
  void _saveInputData(QuizInputData inputData) {
    if(inputData.strAnswer == strInput) {
      eCurQuizState = QUIZ_STATE.correct;
    }
    else {
      eCurQuizState = QUIZ_STATE.notCorrect;
    }

    inputData.eQuizState = eCurQuizState;
    inputData.strInput = strInput;
  }

  void _saveChoiceData(QuizChoiceData choiceData) {
    if(choiceData.iAnswerIdx == iSelectedIdx) {
      eCurQuizState = QUIZ_STATE.correct;
    }
    else {
      eCurQuizState = QUIZ_STATE.notCorrect;
    }

    choiceData.eQuizState = eCurQuizState;
    choiceData.iSelectedIdx = iSelectedIdx;
  }

  // when it's done, call this function
  void _saveQuizState() {
    if(!_isValidIdx() || quizDao.arrQuiz[iCurQuizIdx].eQuizType == QUIZ_TYPE.none) {
      return;
    }

    if(quizDao.arrQuiz[iCurQuizIdx].eQuizType == QUIZ_TYPE.input) {
      _saveInputData(quizDao.getQuizInput(iCurQuizIdx));
    }
    else {
      _saveChoiceData(quizDao.getQuizChoice(iCurQuizIdx));
    }
  }

  void changeQuiz(bool isNext) {

    if(isNext) {

      if((iCurQuizIdx < quizDao.getQuizSize() - 1)) {
        _saveQuizState();
        ++iCurQuizIdx;
        _setCurQuizState();
        notifyDataSetChanged();
      }
      else {
        // end event
        showToast("end of quiz");
      }

    }
    else if(!isNext) {

      if((iCurQuizIdx > 0)) {
        _saveQuizState();
        --iCurQuizIdx;
        _setCurQuizState();
        notifyDataSetChanged();
      }
      else {
        // ignore this step
        showToast("ignore this step");
      }

    }
  }


}