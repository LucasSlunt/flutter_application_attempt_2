import 'dart:math';

import 'package:flutter/material.dart';
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
        child: Text("elevated Button"),
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
        title: Text("Second page"),
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index){
          return Container(
            color: Color.fromARGB(255, Random().nextInt(255), 0, 0),
            height: 500,
            width: 500,
            //child: Text("Page $index"),
            //child: ExerciseWidget("$index").buildName(context)
            child: ReppedSetWidget(name: "exercise 1"),
          );
        }
      ),
    );
  }
}

class ExerciseWidget {
  final String name;
    
  ExerciseWidget(this.name);

  Widget buildName(BuildContext context){

    return Text(name, style: Theme.of(context).textTheme.headlineLarge);
  }
}
/*
class ReppedSetWidget {

  ReppedSet set = ReppedSet();

  Widget buildNumberOfReps(BuildContext context){
    return ElevatedButton(
      onPressed: () => {

      }, 
      child: Text("Number of Reps: "));
  }
}*/

class ReppedSetWidget extends StatefulWidget{
  final String name;

  const ReppedSetWidget({super.key, required this.name});

  @override ReppedSetState createState() => ReppedSetState();
}

class ReppedSetState extends State<ReppedSetWidget> {
  int numOfReps = 0;

  @override
  Widget build(BuildContext context){
    //return Text('${widget.name}: $numOfReps');
    return GestureDetector(
      onTap: () {
        setState(() {
          numOfReps++;
        });
      },
      child: Text('${widget.name}: $numOfReps'),
    );
  }
}