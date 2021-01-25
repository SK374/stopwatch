import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  bool startStop = true;
  bool reset = true;
  String stopDispTime = '00:00';
  var stopwatch = Stopwatch();
  final duration = const Duration(milliseconds: 1);

  void startTimer() {
    Timer(duration, continueToRun);
  }

  void continueToRun() {
    if (stopwatch.isRunning) {
      startTimer();
    }
    setState(() {
      stopDispTime = (stopwatch.elapsed.inSeconds).toString().padLeft(2, '0') + ':' +
          (stopwatch.elapsed.inMilliseconds / 10 % 100).truncate().toString().padLeft(0, '0');
    });
  }

  void startStopStopWatch() {
    if (startStop) {
      startStopwatch();
    } else {
      stopStopWatch();
    }
  }

  void startStopwatch() {
    setState(() {
      startStop = false;
    });
    stopwatch.start();
    startTimer();
  }

  void stopStopWatch() {
    setState(() {
      startStop = true;
      reset = false;
    });
    stopwatch.stop();
  }

  void resetStopWatch() {
    setState(() {
      reset = true;
      stopDispTime = '00:00';
    });
    stopwatch.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              stopDispTime,
              style: TextStyle(fontSize: 90),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  onPressed: () => startStopStopWatch(),
                  color: Colors.green,
                  child: Text(
                    'START',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(width: 40),
                RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  onPressed: startStop ? resetStopWatch : null,
                  color: Colors.red,
                  child: Text(
                    'RESET',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}