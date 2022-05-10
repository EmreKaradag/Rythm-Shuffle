import 'package:flutter/material.dart';
import 'package:rhytm2/Data/my_icons_icons.dart';

class Data {
  static final String sound = 'beat.mp3';

  static final List<String> boxImage = [];

  static final List<Color> boxColor = [
    Colors.red.shade400,
    Colors.blue.shade400,
    Colors.green.shade400,
    Colors.yellow.shade400,
    Colors.pink.shade400,
    Colors.orange.shade400,
    Colors.purple.shade400,
    Colors.cyan.shade400
  ];
  
  static final List<String> images = [
    'assets/images/0.png',
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
    'assets/images/7.png',
  ];

  
  

  //pictures of notes have different ratios.So to avoid visual inconsistency,i manually tweaked their ratios with alignment values.
  static final List<double> valuePadding = [40, 30, 25, 5, 20, 20, 20, 20];
}
