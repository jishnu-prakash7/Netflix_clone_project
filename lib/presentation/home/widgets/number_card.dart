import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_new/core/constants.dart';

class NumberCard extends StatelessWidget {
  final int index;
  final image;
  const NumberCard({super.key, required this.index, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              height: 200,
              width: 130,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(image),
                  ),
                  borderRadius: KborderRadius10),
            ),
          ],
        ),
        Positioned(
          left: 20,
          bottom: -35,
          child: BorderedText(
            strokeColor: const Color.fromARGB(255, 230, 229, 229),
            strokeWidth: 6.0,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 120,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
