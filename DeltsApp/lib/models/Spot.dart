import 'package:flutter/material.dart';

class Spot {
  final String id;
  final String title;
  int queueLength;
  
  Spot(
    {@required this.id,
    @required this.title, 
    @required this.queueLength,
    });
  
  void increaseQueuelength() {
    queueLength = queueLength + 1;
  }
}