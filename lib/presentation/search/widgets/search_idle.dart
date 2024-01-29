import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_new/constants.dart';
import 'package:netflix_clone_new/core/colors/colors.dart';
import 'package:netflix_clone_new/core/constants.dart';
import 'package:netflix_clone_new/presentation/home/screen_home.dart';
import 'package:netflix_clone_new/presentation/search/widgets/searchTitle.dart';


class SearchIdelWidget extends StatelessWidget {
  const SearchIdelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Top Searches',
        ),
        kHeight,
        FutureBuilder(
            future: topratedMovies,
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
                return Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) => TopSearchItemTile(
                            movieName: snapshot.data![index].originalTitle,
                            moviePoster: Constants.imagePath +
                                snapshot.data![index].backDropPath,
                          ),
                      separatorBuilder: (ctx, index) => kHeight20,
                      itemCount: snapshot.data!.length),
                );
              } else {
                throw Exception('something went wrong');
              }
            })
      ],
    );
  }
}

class TopSearchItemTile extends StatefulWidget {
  final String movieName;
  final String moviePoster;

  const TopSearchItemTile(
      {super.key, required this.movieName, required this.moviePoster});

  @override
  State<TopSearchItemTile> createState() => _TopSearchItemTileState();
}

class _TopSearchItemTileState extends State<TopSearchItemTile> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.4,
          height: 90,
          decoration: BoxDecoration(
              borderRadius: KborderRadius10,
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(widget.moviePoster))),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              widget.movieName,
              style: const TextStyle(
                  color: kWhite, fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kWhite,
          radius: 22,
          child: CircleAvatar(
            backgroundColor: kblack,
            radius: 20,
            child: Icon(CupertinoIcons.play),
          ),
        )
      ],
    );
  }
}
