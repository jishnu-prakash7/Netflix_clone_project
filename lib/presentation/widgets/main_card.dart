import 'package:flutter/material.dart';
import 'package:netflix_clone_new/core/constants.dart';

const imageUrl =
    'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/pwOQ9lqLX1OgsJRSybS662wMcu8.jpg';

class MainCard extends StatefulWidget {
  const MainCard({
    super.key,
    required this.snapshot,
    required this.Image,
  });

  final Image;
  final AsyncSnapshot snapshot;

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 200,
      width: 130,
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(widget.Image),
          ),
          borderRadius: KborderRadius10),
    );
  }
}
