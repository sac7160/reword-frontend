import 'package:bearvoca/screens/quiz/quizData.dart';
import 'package:flutter/material.dart';

import '../../util/AppFunc.dart';
import '../../util/vocaApp.dart';

enum QUIZ_STATE {
  none,
  correct,
  notCorrect,
}

// you can use ChangeNotifier to show new UI like LiveData in android
// add notifier at root(or specific position) and use Consumer() in child
class QuizNotifier extends ChangeNotifier {

  String strQuizName = "testQuiz";
  QuizDataDAO quizDao = QuizDataDAO("testAddress");
  QUIZ_STATE eCurQuizState = QUIZ_STATE.none;

  int iHoneyCnt = VocaApp.instance.iHoneyCnt;
  int iCurQuizIdx = 0;

  // QUIZ_CHOICE
  int _iSelectedIdx = -1;

  // QUIZ_INPUT
  String _strInput = "";

  int getSelectedIdx() => _iSelectedIdx;
  double getPercent() => (iCurQuizIdx / quizDao.getQuizSize());

  void updateHoneyCount() {
    if(iHoneyCnt != VocaApp.instance.iHoneyCnt){
      iHoneyCnt = VocaApp.instance.iHoneyCnt;
      notifyDataSetChanged();
    }
  }

  void _setCurQuizState() {
    switch(quizDao.arrQuiz[iCurQuizIdx].eQuizType) {
      case QUIZ_TYPE.none: {
        eCurQuizState = QUIZ_STATE.none;
        _iSelectedIdx = -1;
        _strInput = "";
        break;
      }

      case QUIZ_TYPE.input: {
        QuizInputData quiz = quizDao.getQuizInput(iCurQuizIdx);
        _iSelectedIdx = -1;
        eCurQuizState = quiz.eQuizState;
        _strInput = quiz.strInput;
        break;
      }

      case QUIZ_TYPE.choiceKor:
      case QUIZ_TYPE.choiceEng: {
        QuizChoiceData quiz = quizDao.getQuizChoice(iCurQuizIdx);
        _iSelectedIdx = quiz.iSelectedIdx;
        eCurQuizState = quiz.eQuizState;
        _strInput = "";
        break;
      }
    }

    notifyDataSetChanged();
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
    bool isCorrect = quizDao.getQuizInput(iCurQuizIdx).strAnswer == _strInput;
    if(isCorrect) {
      eCurQuizState = QUIZ_STATE.correct;
    }
    else {
      eCurQuizState = QUIZ_STATE.notCorrect;
    }
    return isCorrect;
  }

  bool _isCorrectChoice() {
    if(_iSelectedIdx == -1) {
      return false;
    }

    bool isCorrect = quizDao.getQuizChoice(iCurQuizIdx).iAnswerIdx == _iSelectedIdx;
    if(isCorrect) {
      eCurQuizState = QUIZ_STATE.correct;
    }
    else {
      eCurQuizState = QUIZ_STATE.notCorrect;
    }

    return isCorrect;
  }

  bool _isValidIdx() {
    return iCurQuizIdx >= 0 && iCurQuizIdx < quizDao.getQuizSize();
  }

  void notifyDataSetChanged() {
    notifyListeners();
  }

  // check the result of a quiz and save
  void _saveInputData(QuizInputData inputData) {
    if(inputData.strAnswer == _strInput) {
      eCurQuizState = QUIZ_STATE.correct;
    }
    else {
      eCurQuizState = QUIZ_STATE.notCorrect;
    }

    inputData.eQuizState = eCurQuizState;
    inputData.strInput = _strInput;
  }

  void _saveChoiceData(QuizChoiceData choiceData) {
    if(choiceData.iAnswerIdx == _iSelectedIdx) {
      eCurQuizState = QUIZ_STATE.correct;
    }
    else {
      eCurQuizState = QUIZ_STATE.notCorrect;
    }

    choiceData.eQuizState = eCurQuizState;
    choiceData.iSelectedIdx = _iSelectedIdx;
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

  void setSelectedIdx(int iIdx) {
    if(!_isValidIdx() || iIdx < 0 || iIdx >= 3 ||
        quizDao.arrQuiz[iCurQuizIdx].eQuizType == QUIZ_TYPE.input ||
        quizDao.arrQuiz[iCurQuizIdx].eQuizType == QUIZ_TYPE.none) {
      return;
    }

    _iSelectedIdx = iIdx;
    _isCorrectChoice();
    notifyDataSetChanged();
  }

  void setInputString(String? strInput) {
    if(!_isValidIdx() || strInput == null || strInput.isEmpty ||
        quizDao.arrQuiz[iCurQuizIdx].eQuizType == QUIZ_TYPE.input) {
      return;
    }

    _strInput = strInput;
    _isCorrectInput();
    notifyDataSetChanged();
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