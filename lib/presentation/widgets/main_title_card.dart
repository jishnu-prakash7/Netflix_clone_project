import 'package:flutter/material.dart';
import 'package:netflix_clone_new/constants.dart';
import 'package:netflix_clone_new/core/constants.dart';
import 'package:netflix_clone_new/models/movie/movie.dart';
import 'package:netflix_clone_new/presentation/widgets/main_card.dart';
import 'package:netflix_clone_new/presentation/widgets/main_title.dart';

class MainTitleCard extends StatefulWidget {
  final String title;
  final Future<List<Movie>> type;
  const MainTitleCard({
    super.key,
    required this.title,
    required this.type,
  });

  @override
  State<MainTitleCard> createState() => _MainTitleCardState();
}

class _MainTitleCardState extends State<MainTitleCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: widget.title),
        kHeight,
        FutureBuilder(
            future: widget.type,
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
                        snapshot.data!.length,
                        (index) => MainCard(
                              snapshot: snapshot,
                              Image: Constants.imagePath +
                                  snapshot.data![index].posterPath,
                            )),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ],
    );
  }
}
