import 'dart:math';

import 'package:flutter/material.dart';

class ColorGenerator {
  Color getRandomColor([double opacity = 1]) {
    Random random = Random();
    Color tempColor = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    ).withOpacity(opacity);
    return tempColor;
  }
}
