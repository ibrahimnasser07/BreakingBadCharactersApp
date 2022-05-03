import 'package:bloc/bloc.dart';
import 'package:breaking_bad_characters/data/models/characters.dart';
import 'package:breaking_bad_characters/data/models/quote.dart';
import 'package:breaking_bad_characters/data/repository/characters_repo.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.charactersRepo) : super(CharactersInitial());

  final CharactersRepo charactersRepo;
  List<Character> characters = [];

  List<Character> getAllCharacters() {
    charactersRepo.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }

  void getCharacterQuotes(String author) {
    charactersRepo.getCharacterQuotes(author).then((quotes) {
      emit(QuotesLoaded(quotes));
    });
  }
}
