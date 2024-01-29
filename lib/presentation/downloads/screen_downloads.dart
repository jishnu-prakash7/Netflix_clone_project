
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone_new/core/colors/colors.dart';
import 'package:netflix_clone_new/core/constants.dart';
import 'package:netflix_clone_new/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final List _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppBarWidget(
                title: 'Downloads',
              )),
          body: ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) => _widgetList[index],
              separatorBuilder: (context, index) => const SizedBox(
                    height: 30,
                  ),
              itemCount: _widgetList.length)),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List imageList = [
    'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/pwOQ9lqLX1OgsJRSybS662wMcu8.jpg',
    'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/qJiWKzdRScI5OcRQqOu3qdMZKXY.jpg',
    'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/hXWBc0ioZP3cN4zCu6SN3YHXZVO.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhite, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          'We will download a personalised selection of\n movies and shows for you,so there is\nalways something to watch on your\n device',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.5),
                radius: size.width * .3,
              ),
              downloadImageWidget(
                width: size.width * .3,
                height: size.width * .48,
                angle: 25,
                imageList: imageList[0],
                margin: const EdgeInsets.only(left: 170, bottom: 20, top: 25),
              ),
              downloadImageWidget(
                width: size.width * .3,
                height: size.width * .48,
                angle: -25,
                imageList: imageList[1],
                margin: const EdgeInsets.only(right: 170, bottom: 20, top: 25),
              ),
              downloadImageWidget(
                width: size.width * .35,
                height: size.width * .5,
                imageList: imageList[2],
                margin: const EdgeInsets.only(top: 25),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: size.width * .98,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {},
            color: kButtoncolorBlue,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: TextStyle(
                    color: kButtonColorWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {},
          color: kButtonColorWhite,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  color: kblack, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: kWhite,
        ),
        Text(
          'Smart Downloads',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class downloadImageWidget extends StatelessWidget {
  const downloadImageWidget({
    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.height,
    required this.width,
  });
  final double height;
  final double width;
  final String imageList;
  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(imageList))),
      ),
    );
  }
}
