import 'package:breaking_bad_characters/constants/my_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  final String title;
  final String image;
  final int heroTag;
  const MySliverAppBar({
    Key? key,
    required this.title,
    required this.image,
    required this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // 3/4 of the screen size.
      expandedHeight: MediaQuery.of(context).size.height -
          MediaQuery.of(context).size.height / 4,
      pinned: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
          tag: heroTag,
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
            placeholder: (_, s) => const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
