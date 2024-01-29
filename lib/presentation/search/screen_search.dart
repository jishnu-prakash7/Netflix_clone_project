import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_new/core/constants.dart';
import 'package:netflix_clone_new/presentation/search/widgets/search_idle.dart';
import 'package:netflix_clone_new/presentation/search/widgets/search_result.dart';

bool searchbarValue = false;

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoSearchTextField(
            onTap: () {
              setState(() {
                searchbarValue = true;
              });
            },
            onSubmitted: (value) {
              setState(() {
                searchbarValue = false;
              });
            },
            backgroundColor: Colors.grey.withOpacity(0.4),
            style: const TextStyle(color: Colors.white),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            suffixIcon: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: Colors.grey,
            ),
          ),
        ),
        kHeight,
        Expanded(
            child: searchbarValue
                ? const SearchIdelWidget()
                : const SearchResultWidget()),
      ],
    ));
  }
}
