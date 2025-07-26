import 'package:flutter/material.dart';
import 'package:flutter_application_attempt_2/features/record_workout/widgets/exercise.dart';
import 'dart:math';

class WorkoutWidget extends StatefulWidget{
  WorkoutWidget({super.key});

final List<ExerciseWidget> exerciseWidgets = [ExerciseWidget()];

  @override
  WorkoutWidgetState createState() => WorkoutWidgetState();

}
class WorkoutWidgetState extends State<WorkoutWidget>{
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Text("Workout Name", style: Theme.of(context).textTheme.headlineLarge),
        Text("time"),
        Container(
          width: 500,
          height: 600,
          margin: EdgeInsets.all(20),
          color: Color.fromARGB(255, 110, 222, 118),
          /*
          child: ListView.builder(
            itemCount: widget.exerciseWidgets.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
                return widget.exerciseWidgets[index];
              }
            ),*/

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
              
              print("ExerciseWidgets length: ${widget.exerciseWidgets.length}");
            
          },
          child: Text("Add exercise")
        ),
        
      ]
    );
  }
  
}