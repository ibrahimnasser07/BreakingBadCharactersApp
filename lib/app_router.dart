import 'package:breaking_bad_characters/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad_characters/data/repository/characters_repo.dart';
import 'package:breaking_bad_characters/data/web_services/characters_web_services.dart';
import 'package:breaking_bad_characters/presentation/screens/characters_screen.dart';
import 'package:breaking_bad_characters/presentation/screens/characters_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/strings.dart';

class AppRouter {
  late CharactersRepo charactersRepo;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepo = CharactersRepo(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const CharacterDetailsScreen());
      default:
        return null;
    }
  }
}
