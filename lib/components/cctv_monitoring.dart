import 'package:cctv/components/log_panel.dart';
import 'package:cctv/components/video_player_screen.dart';
import 'package:flutter/material.dart';

class CCTVMonitoring extends StatelessWidget {
  const CCTVMonitoring({super.key});

  @override
  Widget build(BuildContext context) {
    var calculatedHeight = MediaQuery.of(context).size.height * (2 / 3);

    return 
    SizedBox(
      height: calculatedHeight,
      child: Row(
      children:[
        Column(
        children: [
          const Text("CCTV Monitoring"),
          SizedBox(
            height: calculatedHeight - 20,
            child: const VideoPlayerScreen(url: 'VIRAT_S_010001_02_000195_000498.mp4', urlType: 'asset'),
          ),
          ],
        ),
        Column(
            children: [
              const Text("Latest Activity Detected"),
              VideoStack(parrentHeight: calculatedHeight - 20)
              ]
            ),
        const LogPanel(),
        ]),
      );
  }
}

class VideoStack extends StatelessWidget {
  const VideoStack({super.key, required this.parrentHeight});

  final double parrentHeight;

  @override
  Widget build(BuildContext context) {
    
    return Column(
              children: [
                SizedBox(
                  height: parrentHeight/3,
                  child: const VideoPlayerScreen(url: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4', urlType: 'asset'),
                ),
                SizedBox(
                  height: parrentHeight/3,
                  child: const VideoPlayerScreen(url: 'https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4', urlType: 'asset'),
                ),
                SizedBox(
                  height: parrentHeight/3,
                  child: const VideoPlayerScreen(url: 'https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4', urlType: 'asset'),
                ),
                ],
              );
  }
}