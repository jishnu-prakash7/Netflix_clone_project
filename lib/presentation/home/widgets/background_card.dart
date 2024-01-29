import 'package:flutter/material.dart';
import 'package:netflix_clone_new/core/colors/colors.dart';
import 'package:netflix_clone_new/core/constants.dart';
import 'package:netflix_clone_new/presentation/home/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 630,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(KmainImage), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  title: 'My List',
                  icon: Icons.add,
                ),
                _playButton(),
                const CustomButtonWidget(title: 'Info', icon: Icons.info)
              ],
            ),
          ),
        )
      ],
    );
  }

  //Play Button

  TextButton _playButton() {
    return TextButton.icon(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          backgroundColor: MaterialStateProperty.all(kWhite)),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: kblack,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 20, color: kblack),
        ),
      ),
    );
  }
}
