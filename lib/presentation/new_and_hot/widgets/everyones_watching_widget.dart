import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_new/core/colors/colors.dart';
import 'package:netflix_clone_new/core/constants.dart';
import 'package:netflix_clone_new/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone_new/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatefulWidget {
  const EveryonesWatchingWidget({
    super.key,
    required this.movieName,
    required this.movieDescription,
    required this.poster,
  });
  final String movieName;
  final String movieDescription;
  final String poster;

  @override
  State<EveryonesWatchingWidget> createState() =>
      _EveryonesWatchingWidgetState();
}

class _EveryonesWatchingWidgetState extends State<EveryonesWatchingWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight,
          VideoWidget(
            poster: widget.poster,
          ),
          kHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  widget.movieName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              const CustomButtonWidget(
                title: 'Share',
                icon: Icons.send,
                iconSize: 22,
                textSize: 14,
              ),
              kWidth,
              const CustomButtonWidget(
                title: 'My List',
                icon: CupertinoIcons.add,
                iconSize: 22,
                textSize: 14,
              ),
              kWidth,
              const CustomButtonWidget(
                title: 'Play',
                icon: CupertinoIcons.play_arrow_solid,
                iconSize: 22,
                textSize: 14,
              ),
              kWidth
            ],
          ),
          kHeight,
          Text(
            widget.movieDescription,
            style: const TextStyle(color: KcolorGrey),
          ),
          Kheight50,
        ],
      ),
    );
  }
}
