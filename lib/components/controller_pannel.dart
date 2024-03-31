import 'package:flutter/material.dart';

class ControllerPannel extends StatelessWidget {
  const ControllerPannel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Button to take a picture
            FilledButton(onPressed: null, child: Icon(Icons.camera_alt)),

            // Button to start recording
            FilledButton(onPressed: null, child: Icon(Icons.videocam)),

            // Button to stop recording
            FilledButton(onPressed: null, child: Icon(Icons.videocam_off)),
          ],
        ));
  }
}
