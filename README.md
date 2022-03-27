# Reword FrontEnd
Reword FrontEnd팀 저장소입니다.

### Members
|이름|깃허브|
|------|---|
|😊 김유민|[Github](https://github.com/yumin2019)|
|😊 박창현|[Github](https://github.com/sac7160)|

# Skills
<img src="https://user-images.githubusercontent.com/49779139/158051210-1c6991c5-4f2f-4c0d-a545-afdf15f9babd.png" width="30%" height="30%"/>

Flutter를 이용하여 Andorid, IOS 어플을 동시에 개발합니다. 

# Convention
커밋 메시지 
- change: 기존에 있는 기능에서 변경사항이 생긴 경우
- feat: 새로운 기능 추가
- fix: 버그 픽스
- docs: 문서 수정
- resource: 리소스 추가(string, image 등)
- style: 세미콜론 수정, 코드 정리 등 스타일에 대한 수정
- refactor: 코드 리펙토링
- test: 테스트 코드 추가
- chore: 빌드 관련 변경 사항

### 변수명

|예시|변수명|
|------|---|
|유저 이름(String)|strUserName|
|꿀 개수(int)|iHoneyCnt|
|QUIZ_STATE(enum)|eQuizState|
|QuizDao(class)|quizDao|


### 파일명, 함수명
|예시|파일명, 함수명|
|------|---|
|퀴즈 데이터|quizData|
|메인 화면|mainScreen|

#### *클래스명은 대문자로 처리중

### 공통된 상수 처리(values 폴더에 dimensions, colors 추가)

공통으로 사용하는 상수를 일괄적으로 관리(문자열의 경우에는 다국어 처리를 하지 않으므로 제외)
