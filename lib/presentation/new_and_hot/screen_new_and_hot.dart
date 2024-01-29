import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_new/constants.dart';
import 'package:netflix_clone_new/core/colors/colors.dart';
import 'package:netflix_clone_new/core/constants.dart';
import 'package:netflix_clone_new/presentation/home/screen_home.dart';
import 'package:netflix_clone_new/presentation/new_and_hot/widgets/coming_soon_widgets.dart';
import 'package:netflix_clone_new/presentation/new_and_hot/widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
              title: const Text(
                'New & Hot',
                style: TextStyle(
                    fontSize: 26, fontWeight: FontWeight.w900, color: kWhite),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                ),
                kWidth,
                Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://wallpapers.com/images/hd/netflix-profile-pictures-1000-x-1000-88wkdmjrorckekha.jpg'),
                    ),
                  ),
                ),
                kWidth
              ],
              bottom: TabBar(
                tabAlignment: TabAlignment.start,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 0,
                dividerHeight: 0,
                indicatorColor: Colors.transparent,
                labelColor: kblack,
                unselectedLabelColor: kWhite,
                isScrollable: true,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicator:
                    BoxDecoration(borderRadius: KborderRadius30, color: kWhite),
                tabs: const [
                  Tab(
                    text: '🍿 Coming Soon',
                  ),
                  Tab(
                    text: "👀 Everyone's Watching",
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(children: [
            _buildComingSoon(),
            _buildEveryonesWatching(),
          ]),
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return FutureBuilder(
        future: recentReleased,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return ListView(
              children: List.generate(
                snapshot.data!.length,
                (index) => ComingSoonWidget(
                  movieName: snapshot.data![index].originalTitle,
                  movieDescription: snapshot.data![index].overview,
                  moviePoster:
                      Constants.imagePath + snapshot.data![index].backDropPath,
                  date: snapshot.data![index].releaseDate,
                ),
              ),
            );
          } else {
            throw Exception('something wrong');
          }
        });
  }

  Widget _buildEveryonesWatching() {
    return FutureBuilder(
        future: trendingMovies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return ListView(
              children: List.generate(
                snapshot.data!.length,
                (index) => EveryonesWatchingWidget(
                  movieDescription: snapshot.data![index].overview,
                  movieName: snapshot.data![index].originalTitle,
                  poster:
                      Constants.imagePath + snapshot.data![index].backDropPath,
                ),
              ),
            );
          } else {
            throw Exception('something wrong');
          }
        });
  }
}
