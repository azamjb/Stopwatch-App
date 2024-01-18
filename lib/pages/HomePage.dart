
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:async';


import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Timer _timer;
  int _milliseconds = 0;
  bool _isRunning = false;

  void _resetTimer() { // function to reset timer
    
    setState(() {
        _milliseconds = 0;
    });   
  }

  void _startTimer() { // function to start timer running
    
    if (!(_isRunning)) {
        _timer = Timer.periodic(Duration(milliseconds: 10), (Timer timer) {
          setState(() {
          _milliseconds += 10;
        });
      });
    }
    _isRunning = true;
  }

  void _stopTimer() { // function to stop timer from running
    
    _timer.cancel();
    _isRunning = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    int milliseconds = _milliseconds % 1000;
    int seconds = (_milliseconds ~/ 1000) % 60;
    int minutes = (_milliseconds ~/ (1000 * 60)) % 60;

     String formattedTime = "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}.${(milliseconds ~/ 10).toString().padLeft(2, '0')}";
    
    return Scaffold( 
      backgroundColor: Colors.black,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            
            Text(formattedTime,style: TextStyle(color: Colors.white, fontSize: 60)),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                MaterialButton(
                  onPressed: _stopTimer, 
                  color: const Color.fromARGB(255, 93, 39, 36),
                  minWidth: 60,
                  height: 75,
                  shape: CircleBorder(),
                  child: Text("Stop", 
                  style: TextStyle(color: Colors.white, fontSize: 12))
                  ),
                Spacer(),
                MaterialButton(
                  onPressed: _resetTimer, 
                  color: const Color.fromARGB(255, 57, 57, 57),
                  minWidth: 60,
                  height: 75,
                  shape: CircleBorder(),
                  child: Text("Reset", 
                  style: TextStyle(color: Colors.white, fontSize: 12))
                  ),
                Spacer(),
                MaterialButton(
                  onPressed: _startTimer, 
                  color: const Color.fromARGB(255, 39, 92, 41),
                  minWidth: 60,
                  height: 75,
                  shape: CircleBorder(),
                  child: Text("Start", 
                  style: TextStyle(color: Colors.white, fontSize: 12))
                  ),
                Spacer()
              ]
            )


          ],

        )
      ),
    );
  }



}