
import 'package:flutter/material.dart';


class speedprovider with ChangeNotifier {

  double _speed = 0;

  double get speed => _speed;


  void setSpeed (double newSpeed){
    _speed = newSpeed;
    notifyListeners();

  }
}