import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            child: Column(
              children: [
                ReppedSetWidget(),
                ReppedSetWidget(),
              ],
            ),
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
                FilteringTextInputFormatter.allow(RegExp(r'[1234567890]'))
              ],
              onChanged: (text) {
                
                print("reps:$text");
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
                FilteringTextInputFormatter.allow(RegExp(r'[1234567890.]'))
              ],
              onChanged: (text) {
                print("weight:$text");
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

class WorkoutSetDataEntry extends StatefulWidget{
  const WorkoutSetDataEntry({super.key});
  
  @override
  State<WorkoutSetDataEntry> createState() =>_WorkoutSetDataEntryState();
  
}

class _WorkoutSetDataEntryState extends State<WorkoutSetDataEntry>{
  final textController = TextEditingController();

    @override
    void dispose(){
      textController.dispose();
      super.dispose();
    }
    
    @override
    Widget build(BuildContext context) {
      return SizedBox(
        width: 50,
        child:
          TextField(
              onChanged: (text) {
                
              },
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "0",
                
                ),
              ),
      );
              
    }

}
