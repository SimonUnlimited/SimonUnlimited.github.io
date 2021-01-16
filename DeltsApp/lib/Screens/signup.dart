import 'package:DeltsApp/models/user.dart';
import 'package:flutter/material.dart';
import '../providers/users.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login.dart';

class SignUp extends StatefulWidget {
  static const routName = '/signup';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void createNewUser(String firstName1, String lastName1, String email1,
      String password1, String phoneNumber1, String graduationDate1) {
      
      
          Provider.of<Users>(context, listen: false).addUser(User(
              firstName: firstName1,
              lastName: lastName1,
              email: email1,
              passWord: password1,
              phoneNumber: phoneNumber1,
              graduationDate: graduationDate1,
          )).catchError((onError) {
            print('addUserError');
          });
              print('done');
        }
      
        final firstNameController = TextEditingController();
        final lastNameController = TextEditingController();
        final emailController = TextEditingController();
        final passwordController = TextEditingController();
        final phoneNumController = TextEditingController();
        final gradDateController = TextEditingController();
      
        @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Delta Tau Delta'),
            ),
            body: SingleChildScrollView(
              child: Form(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: Text('First Name'),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextFormField(
                        controller: firstNameController,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: Text('Last Name'),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextFormField(
                        controller: lastNameController,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: Text('Email'),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextFormField(
                        controller: emailController,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: Text('Password'),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextFormField(
                        controller: passwordController,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: Text('Phone Number'),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextFormField(
                        controller: phoneNumController,
                        decoration: InputDecoration(labelText: '+X XXX-XXX-XXXX'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: Text('Graduation Date'),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextFormField(
                        controller: gradDateController,
                        decoration: InputDecoration(labelText: 'mm/yyyy'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1),
                      child: ElevatedButton(
                        onPressed: () {
                          createNewUser(
                              firstNameController.text,
                              lastNameController.text,
                              emailController.text,
                              passwordController.text,
                              phoneNumController.text,
                              gradDateController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text('Sign Up'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      }
      

