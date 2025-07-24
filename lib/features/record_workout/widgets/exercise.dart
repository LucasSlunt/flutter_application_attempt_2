import 'package:flutter/material.dart';
import '/data/repped_set.dart';
import '/features/record_workout/widgets/repped_set.dart';
import '/data/enums_exercise_types.dart';
import '/data/enums_muscles.dart';
import '/data/active_exercise.dart';

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
  ExerciseWidgetState createState() => ExerciseWidgetState();
}

class ExerciseWidgetState extends State<ExerciseWidget>{
    List<ReppedSetWidget> setWidgets = [];
    
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.exercise.name, style: Theme.of(context).textTheme.headlineLarge),
        Column(
          children: setWidgets,
        ),
        ElevatedButton(
          child: Text("Add Set"),
          onPressed: () {
            print("button presed");
            ReppedSet newSet = ReppedSet();
            widget.exercise.addSet(newSet);
            setState(() {
              setWidgets.add(ReppedSetWidget(set: newSet));
            });
          }
      ),
      ],
      
    );
  }
}

