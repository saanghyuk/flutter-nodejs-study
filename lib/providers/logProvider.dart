import 'package:flutter/foundation.dart';

class LogProvider with ChangeNotifier{
  Future<void> send(String txt) async{
      print("로그를 보냅니다. $txt");
  }
}