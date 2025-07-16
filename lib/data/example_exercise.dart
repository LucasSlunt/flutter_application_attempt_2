//import 'package:flutter/material.dart';
import 'enums_exercise_types.dart';

class ExampleExercise{
  int? exerciseID; //the ? means it is initialized as null
  String name = 'Unnamed Exercise';
  List? primaryMusclesWorked;
  List? secondaryMusclesWorked;
  Enum exerciseType = ExerciseType.other;
  Enum exerciseStatType = ExerciseStatType.reps;
  double? currentPR;
  
}