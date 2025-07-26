import 'package:flutter/material.dart';
import 'package:flutter_application_attempt_2/features/record_workout/widgets/exercise.dart';
import 'package:flutter_application_attempt_2/features/record_workout/widgets/stopwatch.dart';

class WorkoutWidget extends StatefulWidget{
  WorkoutWidget({super.key});

  final List<ExerciseWidget> exerciseWidgets = [ExerciseWidget()];

  @override
  State<WorkoutWidget> createState() => _WorkoutWidgetState();

}
class _WorkoutWidgetState extends State<WorkoutWidget>{
  StopwatchText stopwatch = StopwatchText();

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Text("Workout Name", style: Theme.of(context).textTheme.headlineLarge),
        stopwatch,
        Container(
          width: 500,
          height: 600,
          margin: EdgeInsets.all(20),
          color: Color.fromARGB(255, 110, 222, 118),

          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.exerciseWidgets
                  )
          )


        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              widget.exerciseWidgets.add(ExerciseWidget());
            });      
          },
          child: Text("Add exercise")
        ),
        
      ]
    );
  }
  
}