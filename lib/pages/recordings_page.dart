import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class RecordingsPage extends StatefulWidget {
  const RecordingsPage({super.key});

  @override
  State<RecordingsPage> createState() => _RecordingsPageState();
}

class _RecordingsPageState extends State<RecordingsPage> {
  late List<VideoPlayerController> _videoPlayerControllers;
  late List<ChewieController> _chewieControllers;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayers();
  }

  @override
  void dispose() {
    _videoPlayerControllers.forEach((controller) => controller.dispose());
    _chewieControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _initializeVideoPlayers() {
    _videoPlayerControllers = [
      VideoPlayerController.asset('videos/car-detection.mp4'),
      VideoPlayerController.asset('videos/one-by-one-person-detection.mp4'),
      VideoPlayerController.asset('videos/people-detection.mp4'),
      VideoPlayerController.asset('videos/person-bicycle-car-detection.mp4'),
      VideoPlayerController.asset('videos/store-aisle-detection.mp4'),
      VideoPlayerController.asset('videos/worker-zone-detection.mp4'),
    ];

    _chewieControllers = _videoPlayerControllers
        .map((controller) => ChewieController(
              videoPlayerController: controller,
              autoPlay: false,
              looping: false,
            ))
        .toList();

    Future.wait(_videoPlayerControllers.map((controller) => controller.initialize())).then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recordings'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: _videoPlayerControllers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              height: 400,
              width: 30,
              child: Center(
                child: _videoPlayerControllers[index].value.isInitialized
                    ? Chewie(
                        controller: _chewieControllers[index],
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }

}
