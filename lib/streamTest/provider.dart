import 'dart:async';
import 'package:flutter/foundation.dart';


class StreamTestProvider with ChangeNotifier{

  StreamTestProvider(){
  }

  bool get isStream => this._ss != null;

  int value = 0;
  int valueStream = 0;

  // stream의 제네릭은 콜백이 반환되는 타입

  StreamSubscription? _ss;

  // add호출하는 순간 계속 호출 된다.
  void add(){
    this.value++;
    // this.valueStream++;
    this.notifyListeners();
    if(this._ss != null) return;
    // null이면 stream객체 만들어서 넘겨주고 다시 listen할 수 있게 해줘야 한다.
    _ss = Stream<int>.periodic(Duration(seconds: 1), (int sec) => sec).listen((int event) {
      print(event);
      // event 라고 하는 것은 callback의 반환값이잖아. sec
      // 콜백을 다시 셋팅해주면 되지 않을까?
      this.valueStream = event;
      this.notifyListeners();
    });

  }

  void cancel(){
    this._ss?.cancel();
    this._ss = null;
    // notifylistner는 호출해도 되고 안해도 되고.
    this.notifyListeners();
  }
}

