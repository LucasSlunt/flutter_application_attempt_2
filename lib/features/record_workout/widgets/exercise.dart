import 'package:flutter/material.dart';
import '../data_classes/repped_set.dart';
import '/features/record_workout/widgets/repped_set.dart';
import '/data/enums_exercise_types.dart';
import '/data/enums_muscles.dart';
import '../data_classes/active_exercise.dart';

class ExerciseWidget extends StatefulWidget{
final ActiveExercise exercise = 
  ActiveExercise(
    name: "Bench Press", 
    primaryMusclesWorked: [Muscles.midChest], 
    secondaryMusclesWorked: [Muscles.tricep,Muscles.frontDelt], 
    type: ExerciseType.barbell, 
    statType: ExerciseStatType.reps, 
    currentPR: "155"
    );
    
  ExerciseWidget({super.key});

  @override
  State<ExerciseWidget> createState() => _ExerciseWidgetState();
}

class _ExerciseWidgetState extends State<ExerciseWidget>{
    List<ReppedSetWidget> setWidgets = [];
    
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
      

      children: [
        Text(widget.exercise.name, style: Theme.of(context).textTheme.headlineLarge),

        Container(
          width: 300,
          height: 400,
          color: Color.fromARGB(128, 200, 200, 200),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
              child: Column(
                children: setWidgets
                  )
          )
        ),
        

        ElevatedButton(
          child: Text("Add Set"),
          onPressed: () {
            ReppedSet newSet = ReppedSet();
            widget.exercise.addSet(newSet);
            setState(() {
              setWidgets.add(ReppedSetWidget(set: newSet));
            });
          }
      ),
      
      ],
      
    ),
    );
  }
}

