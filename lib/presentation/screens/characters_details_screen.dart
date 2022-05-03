import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breaking_bad_characters/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad_characters/constants/my_colors.dart';
import 'package:breaking_bad_characters/data/models/characters.dart';
import 'package:breaking_bad_characters/data/models/quote.dart';
import 'package:breaking_bad_characters/presentation/widgets/my_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context)
        .getCharacterQuotes(character.name);
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          MySliverAppBar(
            title: character.nickName,
            image: character.image,
            heroTag: character.charId,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      CharacterInfo(
                        title: 'Name : ',
                        value: character.name,
                        endIndent: 295,
                      ),
                      CharacterInfo(
                        title: 'Job : ',
                        value: character.jobs.join(" / "),
                        endIndent: 310,
                      ),
                      CharacterInfo(
                        title: 'Appeared in : ',
                        value: character.categoryForTwoSeries,
                        endIndent: 245,
                      ),
                      character.appearanceOfSeasons.isEmpty
                          ? const SizedBox()
                          : CharacterInfo(
                              title: 'Seasons : ',
                              value: character.appearanceOfSeasons.join(" / "),
                              endIndent: 270,
                            ),
                      CharacterInfo(
                        title: 'Status : ',
                        value: character.statusIfDeadOrAlive,
                        endIndent: 288,
                      ),
                      character.betterCallSaulAppearance.isEmpty
                          ? const SizedBox()
                          : CharacterInfo(
                              title: 'Better Call Saul Seasons : ',
                              value: character.betterCallSaulAppearance
                                  .join(" / "),
                              endIndent: 140,
                            ),
                      CharacterInfo(
                        title: 'Actor/Actress : ',
                        value: character.acotrName,
                        endIndent: 226,
                      ),
                      const SizedBox(height: 20),
                      BlocBuilder<CharactersCubit, CharactersState>(
                        builder: (context, state) {
                          return CheckQuotesState(state: state);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 500,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CheckQuotesState extends StatelessWidget {
  final CharactersState state;
  const CheckQuotesState({Key? key, required this.state}) : super(key: key);

  Widget displayRandomQuoteOrEmptySpace(CharactersState state) {
    List<Quote> quotes;
    if (state is QuotesLoaded) {
      quotes = (state).quotes;
      if (quotes.isNotEmpty) {
        int randQuoteIndex = Random().nextInt(quotes.length - 1);
        return Center(
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 20,
              color: MyColors.myWhite,
              shadows: [
                Shadow(
                  blurRadius: 7,
                  color: MyColors.myYellow,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                ColorizeAnimatedText(
                  quotes[randQuoteIndex].quote,
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(
                    fontSize: 25,
                    fontFamily: 'Horizon',
                  ),
                  colors: const [
                    Color.fromARGB(255, 241, 232, 94),
                    Color(0xffE1E8EB),
                    Color(0xffFFC107),
                    Colors.red,
                  ],
                ),
              ],
            ),
          ),
        );
      } else {
        return const SizedBox();
      }
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (state is QuotesLoaded) {
      return displayRandomQuoteOrEmptySpace(state);
    } else {
      return const CircularProgressIndicator(color: MyColors.myYellow);
    }
  }
}

class CharacterInfo extends StatelessWidget {
  final String title;
  final String value;
  final double endIndent;
  const CharacterInfo({
    Key? key,
    required this.title,
    required this.value,
    required this.endIndent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.start,
          maxLines: 1,
          text: TextSpan(
            children: [
              TextSpan(
                text: title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: value,
                style: const TextStyle(
                  color: MyColors.myWhite,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Divider(
          color: MyColors.myYellow,
          height: 30,
          endIndent: endIndent,
          thickness: 2,
        ),
      ],
    );
  }
}
