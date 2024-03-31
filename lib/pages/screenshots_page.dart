import 'package:flutter/material.dart';

class ScreenshotsPage extends StatelessWidget {
  const ScreenshotsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Screenshots'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // You can adjust the number of columns as needed
              mainAxisSpacing:
                  20.0, // Adjust the spacing between items vertically
              crossAxisSpacing:
                  20.0, // Adjust the spacing between items horizontally
            ),
            itemCount: 10, // Assuming you have 10 screenshots in assets/p1-10
            itemBuilder: (BuildContext context, int index) {
              final screenshotPath = 'p${index + 1}.png';
              return Image.asset(
                screenshotPath,
                fit: BoxFit.cover, // Adjust the image fit as needed
              );
            },
        )));
  }
}
