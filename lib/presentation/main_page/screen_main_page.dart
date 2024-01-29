
import 'package:flutter/material.dart';
import 'package:netflix_clone_new/presentation/downloads/screen_downloads.dart';
import 'package:netflix_clone_new/presentation/fast_laughs/screen_fast_laughs.dart';
import 'package:netflix_clone_new/presentation/home/screen_home.dart';
import 'package:netflix_clone_new/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_clone_new/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_clone_new/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaughs(),
    const ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return pages[index];
          }),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
