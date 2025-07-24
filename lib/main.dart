import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_attempt_2/data/active_exercise.dart';
import 'package:flutter_application_attempt_2/data/enums_muscles.dart';
import 'package:flutter_application_attempt_2/data/enums_exercise_types.dart';
import 'data/repped_set.dart';
import 'data/timed_set.dart';
import 'data/workout_set.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Liftree"),
        ),

      body: ElevatedButton(
        child: Text("start workout"),
        onPressed: () {
          //start workout button
          Navigator.push(context, MaterialPageRoute(builder: (_) => CurrentWorkoutScreen()));
        },
      ),
      
      )
      
    );
  }
}

class CurrentWorkoutScreen extends StatelessWidget{
  const CurrentWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("my workout"),
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index){
          return Container(
            color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), 0),
            height: 500,
            padding: EdgeInsets.all(100),
            //child: Text("Page $index"),
            //child: ExerciseWidget("$index").buildName(context)
            child: ExerciseWidget()
          );
        }
      ),
    );
  }
}

class ExerciseWidget extends StatefulWidget{
  
  const ExerciseWidget({super.key});

  @override
  ExerciseWidgetState createState() => ExerciseWidgetState();
}

class ExerciseWidgetState extends State<ExerciseWidget>{
  final ActiveExercise exercise = 
  ActiveExercise(
    name: "Bench Press", 
    primaryMusclesWorked: [Muscles.midChest], 
    secondaryMusclesWorked: [Muscles.tricep,Muscles.frontDelt], 
    type: ExerciseType.barbell, 
    statType: ExerciseStatType.reps, 
    currentPR: "155"
    );
    
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(exercise.name, style: Theme.of(context).textTheme.headlineLarge),
        AddSetWidget(exercise: exercise),
      ],
    );
  }
  
}

class AddSetWidget extends StatelessWidget{
  final ActiveExercise exercise;
  const AddSetWidget({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text("Add Set"),
      onPressed: () {
        print("add set pressed");
        exercise.addSet();
      }
      
      );
  }

}
class ReppedSetWidget extends StatefulWidget{

  const ReppedSetWidget({super.key});

  @override 
  ReppedSetState createState() => ReppedSetState();
}

class ReppedSetState extends State<ReppedSetWidget> {
  ReppedSet set = ReppedSet();
  final repTextController = TextEditingController();
  final weightTextController = TextEditingController();

  @override
    void dispose(){
      repTextController.dispose();
      weightTextController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context){
    
    return Container(
      color: Colors.blue,
      height: 50,
      width: 200,
      margin: EdgeInsets.all(10),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //REPS BOX
          SizedBox(
            width: 50,
            child:
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[1234567890]'))
              ],
              onChanged: (text) {
                set.setNumberOfReps(int.parse(text));
                print("reps:${set.getNumberOfReps()}");
              },
              controller: repTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "0",
                
                ),
              ),
      ),
          //WEIGHT BOX
          SizedBox(
            width: 50,
            child:
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('\\d+.{0,1}\\d*'))
              ],
              onChanged: (text) {
                set.setWeightPerRep(double.parse(text));
                print("reps:${set.getWeightPerRep()}");
              },
              controller: weightTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "0",
                
                ),
              ),
      ),
        ],
      )
    );
    
  }
}