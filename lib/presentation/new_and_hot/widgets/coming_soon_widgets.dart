import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone_new/core/colors/colors.dart';
import 'package:netflix_clone_new/core/constants.dart';
import 'package:netflix_clone_new/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone_new/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String movieName;
  final String movieDescription;
  final String moviePoster;
  final DateTime date;
  const ComingSoonWidget({
    super.key,
    required this.movieName,
    required this.movieDescription,
    required this.moviePoster,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  DateFormat('MMM').format(date).toUpperCase(),
                  style: const TextStyle(fontSize: 17, color: KcolorGrey),
                ),
                Text(
                  DateFormat('dd').format(date),
                  style: const TextStyle(
                      letterSpacing: 5,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: size.width - 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(
                  poster: moviePoster,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        movieName,
                        style: GoogleFonts.shadowsIntoLight(
                            textStyle: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const Spacer(),
                    const Row(
                      children: [
                        CustomButtonWidget(
                          title: 'Remind me',
                          icon: CupertinoIcons.bell,
                          iconSize: 20,
                          textSize: 12,
                        ),
                        kWidth,
                        CustomButtonWidget(
                          title: 'Info',
                          icon: CupertinoIcons.info,
                          iconSize: 20,
                          textSize: 12,
                        ),
                        kWidth
                      ],
                    )
                  ],
                ),
                Text('Coming on ${DateFormat('EEEE').format(date)}'),
                kHeight,
                Text(
                  movieName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                kHeight,
                Text(
                  movieDescription,
                  style: const TextStyle(color: KcolorGrey),
                ),
                Kheight50
              ],
            ),
          ),
        ),
      ],
    );
  }
}
