import 'dart:async';

import 'package:flutter/foundation.dart';

class StreamTestProvider with ChangeNotifier {
  int value = 0;
  int valueStream = 0;
  bool get isStream => this._ss != null;
  bool isPaused = false;

  StreamTestProvider(){}

  Stream<int>? stream;
  StreamSubscription? _ss;


  void add(){
    this.value++;
    this.notifyListeners();

    if(this._ss != null) return;
    stream = Stream<int>.periodic(Duration(seconds:1), (int sec)=> sec);
    _ss = this.stream!.listen((int event) {
      this.valueStream = event;
      this.notifyListeners();
    });

  }
  void cancel(){
      this._ss?.cancel();
      print(_ss);
      this._ss = null;
      this.isPaused = false;
      this.notifyListeners();
    }



  void pause(){
    this._ss?.pause();
    isPaused = true;
    this.notifyListeners();
  }

  void resume(){
    this._ss?.resume();
    isPaused = false;
    this.notifyListeners();
  }




}