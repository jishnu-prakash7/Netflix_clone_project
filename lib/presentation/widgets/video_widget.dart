import 'package:flutter/material.dart';
import 'package:netflix_clone_new/core/colors/colors.dart';
import 'package:netflix_clone_new/core/constants.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({
    super.key,
    required this.poster,
  });
  final String poster;

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: KborderRadius10,
              image: DecorationImage(
                  image: NetworkImage(
                    widget.poster,
                  ),
                  fit: BoxFit.cover)),
          width: double.infinity,
          height: 200,
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 20,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off_outlined,
                color: kWhite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
