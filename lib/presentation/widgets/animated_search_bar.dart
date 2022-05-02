import 'package:breaking_bad_characters/constants/my_colors.dart';
import 'package:breaking_bad_characters/presentation/widgets/anim_search_bar.dart';
import 'package:flutter/material.dart';

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar({
    Key? key,
    required this.searchController,
  }) : super(key: key);
  final TextEditingController searchController;

  @override
  State<AnimatedSearchBar> createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = widget.searchController;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AnimSearchBar(
        width: MediaQuery.of(context).size.width - 20,
        textController: searchController,
        onSuffixTap: () {
          setState(() {
            searchController.clear();
          });
        },
        prefixIcon: const Icon(Icons.search, color: MyColors.myGrey),
        suffixIcon: const Icon(Icons.clear, color: MyColors.myGrey),
        backIcon: const Icon(Icons.arrow_back_rounded, color: MyColors.myGrey),
        color: const Color.fromARGB(255, 255, 238, 86),
        closeSearchOnSuffixTap: true,
        helpText: "Search a character...",
        style: const TextStyle(
          color: MyColors.myGrey,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
