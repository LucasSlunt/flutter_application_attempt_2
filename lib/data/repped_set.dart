import 'package:flutter_application_attempt_2/data/workout_set.dart';

class ReppedSet extends WorkoutSet{
  int _numberOfReps = 0;
  double _weightPerRep = 0;

  ReppedSet();

  int getNumberOfReps(){
    return _numberOfReps;
  }
  setNumberOfReps(int num){
    if (num >= 0){
      _numberOfReps = num;
    }
  }

  double getWeightPerRep(){
    return _weightPerRep;
  }
  setWeightPerRep(double num){
    if (num >= 0){
      _weightPerRep = num;
    }
  }

  @override
  double calculateTotalWeightLifted(){
    return  _weightPerRep * _numberOfReps;
  }
}