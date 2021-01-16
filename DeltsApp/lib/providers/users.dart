import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class Users with ChangeNotifier {
  Map<String, User> users = {
    'laurentkapesa9@gmail.com': User(
      firstName: 'Laurent',
      lastName: 'Kapesa',
      email: 'laurentkapesa9@gmail.com',
      passWord: 'pass42069',
      phoneNumber: '6162648500',
      graduationDate: '2022',
    )
  };

  Future<void> addUser(User user) async {
    const url = 'https://deltsapp-default-rtdb.firebaseio.com/users.json';
    try {
      return http.post(url,
          body: json.encode({
            'firstname': user.firstName,
            'lastname': user.lastName,
            'email': user.email,
            'password': user.passWord,
            'phonenumber': user.phoneNumber,
            'graduationdate': user.graduationDate,
          }));
    } catch (error) {
      print('addUser error');
      throw error;
    }
  }

  User getUserById(String email, String password) {
    return users[email];
  }

  Future<void> getUsers() async {
    const url = 'https://deltsapp-default-rtdb.firebaseio.com/users.json';
    try {
      var response = await http.get(url);
      var data = json.decode(response.body) as Map<String, dynamic>;

      data.forEach((prodId, prodData) {
        users.putIfAbsent(
            prodData['email'],
            () => User(
                  email: prodData['email'],
                  passWord: prodData['password'],
                  firstName: prodData['firstname'],
                  lastName: prodData['lastname'],
                  phoneNumber: prodData['phonenumber'],
                  graduationDate: prodData['graduationdate'],
                  
                ));
      });
    } catch (error) {
      print('getUser Error');
      throw error;
    }
  }

  bool validate(String email, String password) {
    print(users);
    if (users.containsKey(email)) {
      return true;
    } else {
      return false;
    }
  }
}
