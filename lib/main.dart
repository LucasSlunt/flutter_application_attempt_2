import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_attempt_2/features/record_workout/widgets/exercise.dart';

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
            child: ExerciseWidget()
          );
        }
      ),
    );
  }
}


