import 'package:DeltsApp/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/Spot.dart';

class QueueDisplay extends StatefulWidget {
  final String id;
  final String title;
  final int queueLength;
  QueueDisplay({
    @required this.id,
    @required this.title,
    @required this.queueLength,
  });
  @override
  _QueueDisplayState createState() => _QueueDisplayState();
}

class _QueueDisplayState extends State<QueueDisplay> {
  void updateQueue(id, queueLength) {
      if (id == 'NS' || id == 'NU' || id == 'SS' || id == 'SU' ) {
        for (Spot spot in BathRoomSpots) {
          if (spot.id == id) {
            print(spot.title);
              spot.increaseQueuelength();
            }
            print('Updated!');
          }
        }
      else if (id == 'SH') {
        for (Spot spot in ShowerSpots) {
          if (spot.id == id) {
              spot.increaseQueuelength();
            }
          }
        }
      
      else if (id == 'DW1' || id == 'DW2') {
        for (Spot spot in WasherSpots) {
          if (spot.id == id) {
              spot.increaseQueuelength();
            }
          }
        }
      
      else {
        for (Spot spot in DryerSpots) {
          if (spot.id == id) {
            setState(() {
              spot.increaseQueuelength();
            });
          }
        }
      }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      child: Text(
                    widget.queueLength.toString(),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        setState(() {
          updateQueue(widget.id, widget.title);
        });
      },
    );
  }
}

/*Spacer(),
            Row(
              children: [
                Container(
                  child: Text(widget.queueLength.toString()),
                )
              ],
            ),
          ],
        ));
        */
