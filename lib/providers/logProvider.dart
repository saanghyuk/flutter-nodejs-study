import 'package:flutter/foundation.dart';


// 전역 class 혹은 singleton으로 static으로 사용하게 되면, 또 학습해야 되잖아.
// 검증이 되어있는 Provider를 쓰겠다는 것.
class LogProvider with ChangeNotifier{

  // 어떤 일을 수행하기 전과 후를 나눠서 보낼 수 있다.
  // 아니면 시간을 보낸다던가 할 수도 있다.
  Future<void> send(String txt) async => print("로그를 보냅니다. $txt");
}


