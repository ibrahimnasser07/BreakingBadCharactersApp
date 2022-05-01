import 'package:breaking_bad_characters/data/models/characters.dart';
import 'package:breaking_bad_characters/data/web_services/characters_web_services.dart';

class CharactersRepo {
  final CharactersWebServices charactersWebServices;

  CharactersRepo(this.charactersWebServices);

  /// Returns a List of [Character]
  Future<List<Character>> getAllCharacters() async {
    // gets the data as a List<Map> from the characterWebServices, saves it in characters var.
    final characters =
        await charactersWebServices.getAllCharacters();
    // converts the characters var from List<Map> to a list of [Character] var model.
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}