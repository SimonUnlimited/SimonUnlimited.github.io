import 'package:flutter/material.dart';
import 'package:DeltsApp/data.dart';
import '../widgets/QueueDisplay.dart';

class DryerQueue extends StatefulWidget {

  @override
  _DryerQueueState createState() => _DryerQueueState();
}

class _DryerQueueState extends State<DryerQueue> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      itemCount: DryerSpots.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
      ),
      itemBuilder: (ctx, index) {
        return QueueDisplay(id: DryerSpots[index].id, title: DryerSpots[index].title, queueLength: DryerSpots[index].queueLength,);
      }
    );
  }
}