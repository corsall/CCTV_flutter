import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogPanel extends StatefulWidget {
  const LogPanel({super.key});


  @override
  State<LogPanel> createState() => _LogPanelState();
}

class _LogPanelState extends State<LogPanel> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Log Panel"),
        Text("Time 1:00:00 - Person detected in the store"),
        Text("Time 2:05:12 - Vehicle parked outside"),
        Text("Time 4:20:45 - Motion detected in the backyard"),
      ],
    );
  }
}

