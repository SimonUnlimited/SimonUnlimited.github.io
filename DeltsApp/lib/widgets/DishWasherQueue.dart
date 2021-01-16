import 'package:flutter/material.dart';
import 'package:DeltsApp/data.dart';
import '../widgets/QueueDisplay.dart';

class DishWasherQueue extends StatefulWidget {

  @override
  _DishWasherQueueState createState() => _DishWasherQueueState();
}

class _DishWasherQueueState extends State<DishWasherQueue> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      itemCount: WasherSpots.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
      ),
      itemBuilder: (ctx, index) {
        return QueueDisplay(id: WasherSpots[index].id, title: WasherSpots[index].title, queueLength: WasherSpots[index].queueLength,);
      }
    );
  }
}
