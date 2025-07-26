import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchText extends StatefulWidget{
  const StopwatchText({super.key});

    @override
  State<StopwatchText> createState() => _StopwatchTextState();
}

class _StopwatchTextState extends State<StopwatchText>{
  final Stopwatch stopwatch = Stopwatch();
  String elapsedTime = "00:00:00";
  late Timer timer;

  @override
  void initState(){
    super.initState();
    startWatch();
    //every second, the timer will update the displayed time
    timer = Timer.periodic(const Duration(milliseconds: 1000), (Timer timer) {
      setState(() {
        elapsedTime = formatElapsedTime(stopwatch.elapsed);
      });
  });
  }

  void startWatch(){
    stopwatch.start();
  }

  void endWatch(){
    stopwatch.stop();
  }

  String formatElapsedTime(Duration time) {
    return '${time.inHours.remainder(60).toString().padLeft(2, '0')}:${time.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(time.inSeconds.remainder(60)).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Text(elapsedTime);
  }
  
}