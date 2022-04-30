import 'package:breaking_bad_characters/presentation/screens/characters.dart';
import 'package:breaking_bad_characters/presentation/screens/characters_details.dart';
import 'package:flutter/material.dart';
import 'constants/strings.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(builder: (_) => const CharactersScreen());
      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => const CharacterDetailsScreen());
      default:
        return null;
    }
  }
}
