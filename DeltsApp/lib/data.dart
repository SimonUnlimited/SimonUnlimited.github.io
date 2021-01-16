import 'package:DeltsApp/widgets/DishWasherQueue.dart';
import 'package:flutter/material.dart';
import './models/Spot.dart';


 final BathRoomSpots =  [
  Spot(
    id: 'NS',
    title: 'NorthStall',
    queueLength: 5,  
  ),

  Spot(
    id: 'SS',
    title: 'SouthStall',
    queueLength: 5,  
  ),

  Spot(
    id: 'NU',
    title: 'NorthUrinal',
    queueLength: 5,  
  ),

  Spot(
    id: 'SU',
    title: 'SouthUrinal',
    queueLength: 5,  
  ),
];

final ShowerSpots =  [Spot(id: 'SH', title: 'Shower', queueLength: 5)];

final WasherSpots =   [
Spot(
    id: 'DW1',
    title: 'DishWasher 1',
    queueLength: 1,  
  ),
Spot(
    id: 'DW2',
    title: 'DishWasher 2',
    queueLength: 3,  
  ),
];

final DryerSpots =  [
  Spot(
    id: 'D1',
    title: 'Dryer 1',
    queueLength: 1,  
  ),
Spot(
    id: 'D2',
    title: 'Dryer 2',
    queueLength: 3,  
  ),
];
