import "package:flutter_application_attempt_2/data/repped_set.dart";
import "package:flutter_application_attempt_2/data/timed_set.dart";

import 'workout_set.dart';
import "enums_exercise_types.dart";

class ActiveExercise {
  String name;
  List<Enum> primaryMusclesWorked;
  List<Enum> secondaryMusclesWorked;
  Enum type;
  Enum statType;
  double? currentPR;

  List<WorkoutSet> sets = [];

  ActiveExercise({
    required this.name,
    required this.primaryMusclesWorked,
    required this.secondaryMusclesWorked,
    required this.type,
    required this.statType,
    required currentPR
  });

  addSet(){
    if (statType == ExerciseStatType.reps){
      sets.add(ReppedSet());
    }
    else if (statType == ExerciseStatType.timed){
      sets.add(TimedSet());
    }
  }

}