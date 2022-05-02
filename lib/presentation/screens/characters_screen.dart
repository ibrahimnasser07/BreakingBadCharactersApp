import 'package:breaking_bad_characters/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad_characters/constants/my_colors.dart';
import 'package:breaking_bad_characters/data/models/characters.dart';
import 'package:breaking_bad_characters/presentation/widgets/animated_search_bar.dart';
import 'package:breaking_bad_characters/presentation/widgets/loaded_widgets_grid_view.dart';
import 'package:breaking_bad_characters/presentation/widgets/loading_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


final TextEditingController searchController = TextEditingController();

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.myYellow,
        title: const Text(
          "Characters",
          style: TextStyle(color: MyColors.myGrey),
        ),
        actions: [
          AnimatedSearchBar(
            searchController: searchController,
          )
        ],
      ),
      body: const BlocWidget(),
    );
  }
}

// This widget is called in the bidy of the screen.
class BlocWidget extends StatefulWidget {
  const BlocWidget({Key? key}) : super(key: key);

  @override
  State<BlocWidget> createState() => _BlocWidgetState();
}

class _BlocWidgetState extends State<BlocWidget> {
  late List<Character> allCharacters;
  late List<Character> searchedCharacters;
  bool _isSearch = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return LoadedWidgetsGridView(allCharacters: allCharacters);
        } else {
          return const LoadingCircularProgressIndicator();
        }
      },
    );
  }
}
