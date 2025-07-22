import 'active_exercise.dart';

class CurrentWorkout {
  String name = "My Workout";
  List<ActiveExercise> exercises = [];

  CurrentWorkout(this.name);

  bool addNewExercise(){
    //add a new exercise to your workout
    return false;
  }

  bool removeExercise(){
    //remove an exercise from the workout
    return false;
  }

  bool startWorkout(){
    //starts the workout, begins tracking time
    return false;
  }

  bool endWorkout(){
    //ends the workout, gets workout time
    return false;
  }

  double calculateTotalWorkoutVolume(){
    //calculate the total volume of every rep in the workout
    return -1;
  }

  int calculateNumberOfSets(){
    //calculate the number of sets done during the workout
    return -1;
  }

  int calculateNumberOfReps(){
    //calculate the number of reps done during the workout
    return -1;
  }

}