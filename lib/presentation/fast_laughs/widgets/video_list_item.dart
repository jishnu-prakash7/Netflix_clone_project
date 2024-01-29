import 'package:flutter/material.dart';
import 'package:netflix_clone_new/assets/assets.dart';
import 'package:netflix_clone_new/core/colors/colors.dart';
import 'package:netflix_clone_new/presentation/widgets/video_play_widget.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  VideoPlayerController? videoplayerController;

  bool isVolumeOn = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      videoplayerController =
          VideoPlayerController.networkUrl(Uri.parse(videoList[widget.index]));
    });
    videoplayerController!.initialize();
    videoplayerController!.play();
    videoplayerController!.setVolume(5);
    videoplayerController!.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    videoplayerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: SizedBox(
            width: videoplayerController!.value.size.width,
            height: videoplayerController!.value.size.height,
            child: VideoPlayer(videoplayerController!),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side

                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 30,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isVolumeOn == true
                            ? videoplayerController!.setVolume(0)
                            : videoplayerController!.setVolume(5);
                        isVolumeOn = !isVolumeOn;
                      });
                    },
                    icon: Icon(
                      isVolumeOn
                          ? Icons.volume_up_rounded
                          : Icons.volume_off_rounded,
                      color: kWhite,
                    ),
                  ),
                ),

                //right side

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(imageList[widget.index]),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    const VideoActionsWidget(
                        icon: Icons.emoji_emotions, title: 'LOL'),
                    const VideoActionsWidget(icon: Icons.add, title: 'My List'),
                    const VideoActionsWidget(icon: Icons.share, title: 'Share'),
                    VideoPlayWidget(
                      playerController: videoplayerController!,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(color: kWhite, fontSize: 14),
          )
        ],
      ),
    );
  }
}
