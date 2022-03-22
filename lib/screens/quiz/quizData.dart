import '../../util/AppFunc.dart';

const int quizItemSize = 3;

class QuizDataDAO {
  List<QuizData> arrQuiz = [];

  int getQuizSize() => arrQuiz.length;

  Future<bool> loadQuiz() async {
    // accesstoken, body에 데이터 넣고 돌리는 식으로 구현.
    // 퀴즈 데이터 로드 성공
    bool isSuccessful = true;
    if(isSuccessful) {

      bool isChoice = true;
      if(isChoice) {
        // 테스트로 한국어 답안을 고르는 퀴즈를 임의로 생성한다.

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

  QuizData(String _strWord, QUIZ_TYPE eQuiz) {
    strWord = _strWord;
    eQuizType = eQuiz;
  }
}

// 3지선다(한글 or 영어)
class QuizChoiceData extends QuizData {
  List arrAnswer = List.filled(quizItemSize, "");
  int iAnswerIdx = -1;
  bool isKorAnswer = false;
  int iSelectedIdx = -1;

  QuizChoiceData(String _strWord, QUIZ_TYPE _eQuiz, List<String> _arrAnswer, int _iAnswerIdx, bool _isKorAnswer)
      : super(_strWord, _eQuiz) {
    arrAnswer = _arrAnswer;
    iAnswerIdx = _iAnswerIdx;
    isKorAnswer = _isKorAnswer;
  }
}

// 뜻이 한글로 주어지면 영어로 입력하는 형태
class QuizInputData extends QuizData {
  String strInput = "";
  String strAnswer = "";

  QuizInputData(String _strWord, QUIZ_TYPE _eQuiz, String _strAnswer)
      : super(_strWord, _eQuiz) {
    strAnswer = _strAnswer;
  }
}
