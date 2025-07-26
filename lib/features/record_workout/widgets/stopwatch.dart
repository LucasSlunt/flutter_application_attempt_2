import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchText extends StatefulWidget{
  const StopwatchText({super.key});

    @override
  State<StopwatchText> createState() => _StopwatchTextState();
}

class _StopwatchTextState extends State<StopwatchText>{
  final Stopwatch stopwatch = Stopwatch();
  Duration elapsedTime = Duration.zero;
  late Timer timer;

  @override
  void initState(){
    super.initState();
    startWatch();
    //every 100 milliseconds, the timer will update the displayed time
    timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      setState(() {
        elapsedTime = stopwatch.elapsed;
      });
  });
  }

  void startWatch(){
    stopwatch.start();
  }

  void endWatch(){
    stopwatch.stop();
  }

  

  @override
  Widget build(BuildContext context) {
    return Text(stopwatch.elapsed.toString());
  }
  
}