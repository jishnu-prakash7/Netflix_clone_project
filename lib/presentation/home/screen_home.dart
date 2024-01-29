import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone_new/api/api.dart';
import 'package:netflix_clone_new/core/constants.dart';
import 'package:netflix_clone_new/models/movie/movie.dart';
import 'package:netflix_clone_new/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone_new/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone_new/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

late Future<List<Movie>> trendingMovies;
late Future<List<Movie>> topratedMovies;
late Future<List<Movie>> recentReleased;
late Future<List<Movie>> popular;

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    trendingMovies = Api().getTrendingMovies();
    topratedMovies = Api().getTopratedMovies();
    recentReleased = Api().getRecentrelease();
    popular = Api().getPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ValueListenableBuilder(
              valueListenable: scrollNotifier,
              builder: (context, index, _) {
                return NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    final ScrollDirection direction = notification.direction;
                    if (direction == ScrollDirection.reverse) {
                      scrollNotifier.value = false;
                    } else if (direction == ScrollDirection.forward) {
                      scrollNotifier.value = true;
                    }
                    return true;
                  },
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          const BackgroundCard(),
                          MainTitleCard(
                            title: 'Released in the past year',
                            type: recentReleased,
                          ),
                          kHeight,
                          MainTitleCard(
                            title: 'Trending Now',
                            type: popular,
                          ),
                          kHeight,
                          const NumberTitleCard(),
                          MainTitleCard(
                            title: 'Tense Dramas',
                            type: trendingMovies,
                          ),
                          kHeight,
                          MainTitleCard(
                            title: 'South Indian Cinema',
                            type: popular,
                          )
                        ],
                      ),
                      scrollNotifier.value == true
                          ? AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              height: 120,
                              width: double.infinity,
                              color: Colors.black.withOpacity(.2),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          'https://www.pngall.com/wp-content/uploads/13/Netflix-Logo-PNG.png',
                                          height: 60,
                                          width: 60,
                                        ),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.cast,
                                        color: Colors.white,
                                      ),
                                      kWidth,
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          image: const DecorationImage(
                                            image: NetworkImage(
                                                'https://wallpapers.com/images/hd/netflix-profile-pictures-1000-x-1000-88wkdmjrorckekha.jpg'),
                                          ),
                                        ),
                                        height: 30,
                                        width: 30,
                                      ),
                                      kWidth
                                    ],
                                  ),
                                  kHeight,
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('TV Shows',
                                          style: KHomeTitleTextStyle),
                                      Text('Movies',
                                          style: KHomeTitleTextStyle),
                                      Text('Categories',
                                          style: KHomeTitleTextStyle)
                                    ],
                                  )
                                ],
                              ),
                            )
                          : kHeight
                    ],
                  ),
                );
              })),
    );
  }
}
