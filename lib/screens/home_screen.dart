import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 1500;
  bool isRunning  = false;
  late Timer timer;

  void onTick(Timer timer){
    setState(() {
      totalSeconds = totalSeconds-1;
    });
  }

  void onStartPressed(){
    timer = Timer.periodic(Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed(){
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                '$totalSeconds',
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              child: Center(
                child: IconButton(
                  color: Theme.of(context).cardColor,
                  iconSize: 120,
                  onPressed: isRunning? onPausePressed : onStartPressed,
                  icon: Icon(isRunning? Icons.pause_circle_outline : Icons.play_circle_outline),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Theme.of(context).cardColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge?.color,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge?.color,
                            fontSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
