import 'package:breaking_bad_characters/constants/my_colors.dart';
import 'package:breaking_bad_characters/data/models/characters.dart';
import 'package:breaking_bad_characters/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';

class LoadedWidgetsGridView extends StatelessWidget {
  final List<Character> characters;
  const LoadedWidgetsGridView({Key? key, required this.characters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          color: MyColors.myGrey,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return CharacterItem(
                character: characters[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
