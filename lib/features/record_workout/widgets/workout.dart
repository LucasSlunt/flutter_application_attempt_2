import 'package:flutter/material.dart';
import 'package:flutter_application_attempt_2/features/record_workout/widgets/exercise.dart';
import 'dart:math';

class WorkoutWidget extends StatefulWidget{
  const WorkoutWidget({super.key});

  @override
  WorkoutWidgetState createState() => WorkoutWidgetState();
  
}

class WorkoutWidgetState extends State<WorkoutWidget>{
List<ExerciseWidget> exercises = [];

  @override
  Widget build(BuildContext context) {
    exercises.add(ExerciseWidget());
    exercises.add(ExerciseWidget());
    exercises.add(ExerciseWidget());
    return Column(
      children: [
        Text("Workout Name", style: Theme.of(context).textTheme.headlineLarge),
        Text("time"),
        Container(
          width: 500,
          height: 600,
          margin: EdgeInsets.all(20),
          color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), 0),
          child: ListView(
          scrollDirection: Axis.horizontal,
          children: exercises
        )
        ),
        
      ]
    );
  }
  
}