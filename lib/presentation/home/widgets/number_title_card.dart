import 'package:flutter/material.dart';
import 'package:netflix_clone_new/constants.dart';
import 'package:netflix_clone_new/core/constants.dart';
import 'package:netflix_clone_new/presentation/home/screen_home.dart';
import 'package:netflix_clone_new/presentation/home/widgets/number_card.dart';
import 'package:netflix_clone_new/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top 10 TV Shows In India Today'),
        kHeight,
        FutureBuilder(
            future: topratedMovies,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                return LimitedBox(
                  maxHeight: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                        10,
                        (index) => NumberCard(
                              index: index,
                              image: Constants.imagePath +
                                  snapshot.data![index].posterPath,
                            )),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
      ],
    );
  }
}
