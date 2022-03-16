import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../util/AppFunc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Kakao 계정으로 로그인", style: TextStyle(color: Colors.black, fontSize: 25),),
          onPressed: () async {
            _kakaoLoginButton();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.yellowAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ))
        )
      ),
    );
  }
}

Future<void> _kakaoLoginButton() async {

  if (await isKakaoTalkInstalled()) {
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      printLog('카카오톡으로 로그인 성공 token: $token');
    } catch (error) {
      printLog('카카오톡으로 로그인 실패 $error');

      // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
      // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
      if (error is PlatformException && error.code == 'CANCELED') {
        return;
      }
      // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        printLog('카카오톡으로 로그인 성공 token: $token');
      } catch (error) {
        printLog('카카오계정으로 로그인 실패 $error');
      }
    }
  } else {
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      printLog('카카오톡으로 로그인 성공 token: $token');
    } catch (error) {
      printLog('카카오계정으로 로그인 실패 $error');
    }
  }
}
