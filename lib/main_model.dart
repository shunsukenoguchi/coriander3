import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier{
  String text = 'こんにちは';

  void changeText(){
    text = 'hello';
    notifyListeners();
  }
}