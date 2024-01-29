import 'package:flutter/material.dart';
import 'package:netflix_clone_new/core/colors/colors.dart';
import 'package:video_player/video_player.dart';

class VideoPlayWidget extends StatefulWidget {
  final VideoPlayerController playerController;
  const VideoPlayWidget({
    super.key,
    required this.playerController,
  });

  @override
  State<VideoPlayWidget> createState() => _VideoPlayWidgetState();
}

class _VideoPlayWidgetState extends State<VideoPlayWidget> {
  bool isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if (isPlaying) {
                  widget.playerController.pause();
                } else {
                  widget.playerController.play();
                }
                isPlaying = !isPlaying;
              });
            },
            icon: isPlaying
                ? const Icon(Icons.pause)
                : const Icon(Icons.play_arrow),
            color: Colors.white,
            iconSize: 35,
          ),
          isPlaying
              ? const Text(
                  'Pause',
                  style: TextStyle(color: kWhite, fontSize: 16),
                )
              : const Text(
                  'Play',
                  style: TextStyle(color: kWhite, fontSize: 16),
                )
        ],
      ),
    );
  }
}
