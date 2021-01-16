import 'package:DeltsApp/widgets/QueueDisplay.dart';
import 'package:flutter/material.dart';
import 'package:DeltsApp/data.dart';

class BathroomQueue extends StatefulWidget {
  @override
  _BathroomQueueState createState() => _BathroomQueueState();
}

class _BathroomQueueState extends State<BathroomQueue> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      itemCount: BathRoomSpots.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
      ),
      itemBuilder: (ctx, index) {
        return QueueDisplay(id: BathRoomSpots[index].id, title: BathRoomSpots[index].title, queueLength: BathRoomSpots[index].queueLength,);
      }
    );
  }
}
