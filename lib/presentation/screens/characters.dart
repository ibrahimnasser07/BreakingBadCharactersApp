import 'package:breaking_bad_characters/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad_characters/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/characters.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {

  late List<Character> allCharacters;

  @override
  void initState() {
    super.initState();
    allCharacters = BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
      ),
    );
  }
}
