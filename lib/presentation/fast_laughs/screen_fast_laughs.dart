import 'package:flutter/material.dart';
import 'package:netflix_clone_new/presentation/fast_laughs/widgets/video_list_item.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(8, (index) {
          return VideoListItem(index: index);
        }),
      )),
    );
  }
}
