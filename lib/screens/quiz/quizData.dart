import 'package:bearvoca/screens/quiz/quizNotifier.dart';

import '../../util/AppFunc.dart';

const int quizItemSize = 3;

class QuizDataDAO {
  List<QuizData> arrQuiz = [];
  int getQuizSize() => arrQuiz.length;
  QUIZ_TYPE eQuizType = QUIZ_TYPE.none;

  QuizChoiceData getQuizChoice(int iIdx) {
    if(iIdx < 0 || iIdx >= getQuizSize()) {
      return QuizChoiceData();
    }
    else if(arrQuiz[iIdx].eQuizType != QUIZ_TYPE.choiceKor && arrQuiz[iIdx].eQuizType != QUIZ_TYPE.choiceEng) {
      return QuizChoiceData();
    }

    return arrQuiz[iIdx] as QuizChoiceData;
  }

  QuizInputData getQuizInput(int iIdx) {
    if(iIdx < 0 || iIdx >= getQuizSize()) {
      return QuizInputData();
    }
    else if(arrQuiz[iIdx].eQuizType != QUIZ_TYPE.input) {
      return QuizInputData();
    }

    return arrQuiz[iIdx] as QuizInputData;
  }

  QuizDataDAO(String strQuizAddress) {
    loadQuiz(strQuizAddress);
  }

  Future<bool> loadQuiz(String strQuizAddress) async {
    // accesstoken, body에 데이터 넣고 돌리는 식으로 구현.
    // 퀴즈 데이터 로드 성공
    bool isSuccessful = true;
    if(isSuccessful) {

      bool isChoice = true;
      if(isChoice) {
        // 테스트로 한국어 답안을 고르는 퀴즈를 임의로 생성한다.

        arrQuiz.add(QuizChoiceData.set("Apple", QUIZ_TYPE.choiceKor, <String>["사과", "바나나", "딸기"], 0, true));
        arrQuiz.add(QuizChoiceData.set("Banana", QUIZ_TYPE.choiceKor, <String>["사과", "바나나", "딸기"], 1, true));
        arrQuiz.add(QuizChoiceData.set("Strawberry", QUIZ_TYPE.choiceKor, <String>["사과", "바나나", "딸기"], 2, true));
        eQuizType = QUIZ_TYPE.choiceKor;

      } else {

      }

    }
    else {
      printLog("퀴즈 데이터 로드 실패");
    }


    return true;
  }
}

enum QUIZ_TYPE {
  none,
  input,
  choiceKor,
  choiceEng,
}

abstract class QuizData {
  String strWord = "";
  QUIZ_TYPE eQuizType = QUIZ_TYPE.none;
  QUIZ_STATE eQuizState = QUIZ_STATE.none;

  QuizData(String _strWord, QUIZ_TYPE _eQuizType, {QUIZ_STATE eQuizState_ = QUIZ_STATE.none}) {
    strWord = _strWord;
    eQuizType = _eQuizType;
    eQuizState = eQuizState_;
  }
}

// 3지선다(한글 or 영어)
class QuizChoiceData extends QuizData {
  List arrAnswer = List.filled(quizItemSize, "");
  int iAnswerIdx = -1;
  bool isKorAnswer = false;
  int iSelectedIdx = -1;

  QuizChoiceData() : super('', QUIZ_TYPE.none) {

  }

  QuizChoiceData.set(String _strWord, QUIZ_TYPE _eQuiz, List<String> _arrAnswer, int _iAnswerIdx,
      bool _isKorAnswer, {QUIZ_STATE eQuizState_ = QUIZ_STATE.none}) : super(_strWord, _eQuiz, eQuizState_: eQuizState_) {
    arrAnswer = _arrAnswer;
    iAnswerIdx = _iAnswerIdx;
    isKorAnswer = _isKorAnswer;
  }
}

// 뜻이 한글로 주어지면 영어로 입력하는 형태
class QuizInputData extends QuizData {
  String strInput = "";
  String strAnswer = "";

  QuizInputData() : super('', QUIZ_TYPE.none) {

  }

  QuizInputData.set(String _strWord, QUIZ_TYPE _eQuiz, QUIZ_STATE _eQuizState,
      String _strAnswer, {QUIZ_STATE eQuizState_ = QUIZ_STATE.none})
      : super(_strWord, _eQuiz, eQuizState_: eQuizState_) {
    strAnswer = _strAnswer;
  }
}
