import 'package:flutter_application_attempt_2/data/workout_set.dart';

class TimedSet extends WorkoutSet{
  double _duration = 0;
  double _weightPerSet = 0;
  final double totalWeightLiftedMultiplier = 0.1;

double getDuration(){
    return _duration;
  }
  setDuration(double num){
    if (num >= 0){
      _duration = num;
    }
  }

  double getWeightPerSet(){
    return _weightPerSet;
  }
  setWeightPerSet(double num){
    if (num >= 0){
      _weightPerSet = num;
    }
  }

  @override
  double calculateTotalWeightLifted() {
    return _weightPerSet * _duration * totalWeightLiftedMultiplier;
  }

}