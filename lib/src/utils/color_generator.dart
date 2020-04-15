import 'dart:math';

import 'package:flutter/widgets.dart';

class ColorGenerator {
  ColorGenerator._();
  static final _random = Random();

  static Color getRandomColor() {
    return Color.fromARGB(
        255,
        _getRandomColorValue(), 
        _getRandomColorValue(), 
        _getRandomColorValue()
    );
  }
  
  static int _getRandomColorValue() => _random.nextInt(256);

}