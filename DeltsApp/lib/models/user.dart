import 'package:flutter/material.dart';
import 'Spot.dart';

class User {
  final String firstName;
  final String lastName;
  final String email;
  final String passWord;
  final String phoneNumber;
  final String graduationDate;

  User({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.passWord,
    @required this.phoneNumber,
    @required this.graduationDate, 
  });
}
