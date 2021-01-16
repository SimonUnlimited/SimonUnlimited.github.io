import 'package:flutter/material.dart';
import 'package:DeltsApp/data.dart';
import '../widgets/QueueDisplay.dart';

class ShowerQueue extends StatefulWidget {

  @override
  _ShowerQueueState createState() => _ShowerQueueState();
}

class _ShowerQueueState extends State<ShowerQueue> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      itemCount: ShowerSpots.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
      ),
      itemBuilder: (ctx, index) {
        return QueueDisplay(id: ShowerSpots[index].id, title: ShowerSpots[index].title, queueLength: ShowerSpots[index].queueLength,);
      }
    );
  }
}
