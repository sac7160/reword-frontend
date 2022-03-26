import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'AppFunc.dart';

enum LOGIN_RESULT {
  resultOk,
  resultFail,
  resultCancel,
}

enum LOGIN_TYPE {
  kakao,
  apple,
  email,
  none,
}

class VocaApp {
  static final VocaApp instance = VocaApp.init();
  factory VocaApp() => instance;

  String strUserName = "";
  String strUserEmail = "";
  bool isSnsUser = false;
  LOGIN_TYPE eLoginType = LOGIN_TYPE.none;

  int iRewordCnt = 0;
  int iHoneyCnt = 0;

  VocaApp.init() {
    printLog("VocaApp was created");
  }
}

Future<LOGIN_RESULT> tryVocaLogin(String strEmail, String strPassword, {bool isSnsLogin = false}) async {
  // REST API

  // TEST
  return LOGIN_RESULT.resultOk;
}

/* KAKAO LOGIN START */
Future<LOGIN_RESULT> tryKakaoLogin() async {

  // 카카오톡 설치 여부 확인
  // 카카오톡이 설치되어 있으면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
  if (await isKakaoTalkInstalled()) {
    try {
      await UserApi.instance.loginWithKakaoTalk();
      printLog('카카오톡으로 로그인 성공');
      return _getUserInfoByKakao();
    } catch (error) {
      printLog('카카오톡으로 로그인 실패 $error');

      // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
      // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
      if (error is PlatformException && error.code == 'CANCELED') {
        return LOGIN_RESULT.resultCancel;
      }
      // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
      try {
        await UserApi.instance.loginWithKakaoAccount();
        printLog('카카오계정으로 로그인 성공');
        return _getUserInfoByKakao();
      } catch (error) {
        printLog('카카오계정으로 로그인 실패 $error');
        return LOGIN_RESULT.resultFail;
      }
    }
  }

  try {
    await UserApi.instance.loginWithKakaoAccount();
    printLog('카카오계정으로 로그인 성공');
    return _getUserInfoByKakao();
  } catch (error) {
    printLog('카카오계정으로 로그인 실패 $error');
    return LOGIN_RESULT.resultFail;
  }
}

Future<void> tryKakaoLogout() async {
  try {
    await UserApi.instance.logout();
    printLog('로그아웃 성공, SDK에서 토큰 삭제');
  } catch (error) {
    printLog('로그아웃 실패, SDK에서 토큰 삭제 $error');
  }
}

// Delete Kakao account
Future<void> tryKakaoUnlink() async {
  try {
    await UserApi.instance.unlink();
    printLog('연결 끊기 성공, SDK에서 토큰 삭제');
  } catch (error) {
    printLog('연결 끊기 실패 $error');
  }
}

Future<LOGIN_RESULT> _getUserInfoByKakao() async {
  try {
    User user = await UserApi.instance.me();
    printLog('사용자 정보 요청 성공'
        '\n회원번호: ${user.id}'
        '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
        '\n이메일: ${user.kakaoAccount?.email}');

    VocaApp.instance.strUserName = user.kakaoAccount?.profile?.nickname ?? "";
    VocaApp.instance.strUserEmail = user.kakaoAccount?.email ?? "";
    return LOGIN_RESULT.resultOk;
  } catch (error) {
    printLog('사용자 정보 요청 실패 $error');
    return LOGIN_RESULT.resultFail;
  }
}

// https://developers.kakao.com/docs/latest/ko/kakaologin/flutter#additional-consent
// kakao info 추가 항목 동의 받기
Future<void> getUserDetailInfoByKakao() async {
  User user;
  try {
    user = await UserApi.instance.me();
  } catch (error) {
    printLog('사용자 정보 요청 실패 $error');
    return;
  }

  List<String> scopes = [];

  if (user.kakaoAccount?.emailNeedsAgreement == true) {
    scopes.add('account_email');
  }
  if (user.kakaoAccount?.birthdayNeedsAgreement == true) {
    scopes.add("birthday");
  }
  if (user.kakaoAccount?.birthyearNeedsAgreement == true) {
    scopes.add("birthyear");
  }
  if (user.kakaoAccount?.ciNeedsAgreement == true) {
    scopes.add("account_ci");
  }
  if (user.kakaoAccount?.phoneNumberNeedsAgreement == true) {
    scopes.add("phone_number");
  }
  if (user.kakaoAccount?.profileNeedsAgreement == true) {
    scopes.add("profile");
  }
  if (user.kakaoAccount?.ageRangeNeedsAgreement == true) {
    scopes.add("age_range");
  }

  if (scopes.isNotEmpty) {
    printLog('사용자에게 추가 동의 받아야 하는 항목이 있습니다');

    //scope 목록을 전달하여 카카오 로그인 요청
    OAuthToken token;
    try {
      token = await UserApi.instance.loginWithNewScopes(scopes);
      printLog('현재 사용자가 동의한 동의 항목: ${token.scopes}');
    } catch (error) {
      printLog('추가 동의 요청 실패 $error');
      return;
    }

    // 사용자 정보 재요청
    _getUserInfoByKakao();
  }
}

Future<void> getUserDetailInfoAllowedListByKakao() async {
  /*
  List<String> scopes = ['account_email', 'friends'];
  try {
    ScopeInfo scopeInfo = await UserApi.instance.scopes(scopes: scopes);
    print('동의 정보 확인 성공'
          '\n현재 사용자가 동의한 항목: ${scopeInfo.scopes}');
  } catch (error) {
    print('동의 내역 확인 실패 $error');
  }
   */
  try {
    ScopeInfo scopeInfo = await UserApi.instance.scopes();
    printLog('동의 정보 확인 성공'
        '\n현재 사용자가 동의한 항목: ${scopeInfo.scopes}');
  } catch (error) {
    printLog('동의 내역 확인 실패 $error');
  }
}

/* KAKAO LOGIN END */
