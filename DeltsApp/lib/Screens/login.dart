import 'package:DeltsApp/models/user.dart';
import 'package:flutter/material.dart';
import './HomePage.dart';
import '../providers/users.dart';
import 'package:provider/provider.dart';
import 'signup.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';

class Login extends StatefulWidget {
  static const routeName = '/';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // ignore: must_call_super
  var _isInit = true;

  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    //This will continuously be called

    if (_isInit) {
      print('9');
      //runs only when initialized is first called
      Provider.of<Users>(context).getUsers();
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  // ignore: missing_return
  void login(String email, String password) async {
    print('here');
    bool validated = false;
    try {
        validated =
        Provider.of<Users>(context, listen: false).validate(email, password);
    } catch (error) {
      throw error;
    }
    User userLoggingIn;
    try {
       User userLoggingIn =
        Provider.of<Users>(context, listen: false).getUserById(email, password);
    } catch (error) {
      throw error;
    }
   
    
    print('here2');
    print(validated);
    if (validated) {
      try {
        Navigator.pushNamed(
        context,
        HomePage.routeName,
        arguments: userLoggingIn,
      );
      } catch(error) {
        print('Validation Error');
        throw error;
      }
    } else {
      print('error');
    }
  }

  /*return showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Wrong Info'),
                actions: [
                  TextButton(
                    child: Text('Go Back'),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              );
            }
        );
      }
      */

  void signUp() {
    Navigator.pushNamed(context, SignUp.routName);
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Delta Tau Delta'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Text('Email'),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 30, 20),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Text('Password'),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 30, 20),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.purple,
                    ),
                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        login(emailController.text, passwordController.text);
                      },
                      child: Container(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              trailing: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.purple,
                ),
                margin: EdgeInsets.fromLTRB(5, 0, 15, 0),
                child: FlatButton(
                  onPressed: () {
                    signUp();
                  },
                  child: Container(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            /*Row(
              children: [
                Container(
                margin: EdgeInsets.fromLTRB(5, 0, 0, 20),
                child: FlatButton(
                  onPressed: null,
                  child: Container(
                    child: Text('Login'),
                  ),
                ),
                ),
                Spacer(),
                Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 30),
                child: FlatButton(
                  onPressed: null,
                  child: Container(
                    child: Text('SignUP'),
                  ),
                ),
                ),
              ],
            )
            */
          ],
        ));
  }
}
