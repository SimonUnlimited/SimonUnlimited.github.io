import 'package:DeltsApp/widgets/DryerQueue.dart';
import 'package:flutter/material.dart';
import '../widgets/BathroomQueue.dart';
import '../widgets/DishWasherQueue.dart';
import '../widgets/ShowerQueue.dart';
import 'package:DeltsApp/models/user.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/homepage';
  final User user;

  HomePage({this.user});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Delta Tau Delta Gamma Beta"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 0, 10),
              alignment: Alignment.topLeft,
              child: Text("Bathroom"),
            ),
            BathroomQueue(),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
              alignment: Alignment.topLeft,
              child: Text("Shower"),
            ),
            ShowerQueue(),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
              alignment: Alignment.topLeft,
              child: Text("Dishwasher"),
            ),
            DishWasherQueue(),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
              alignment: Alignment.topLeft,
              child: Text("Dryer"),
            ),
            DryerQueue(),
          ],
        ),
      ),
    );
  }
}
