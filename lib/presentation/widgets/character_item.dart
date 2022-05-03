import 'package:breaking_bad_characters/constants/my_colors.dart';
import 'package:breaking_bad_characters/constants/strings.dart';
import 'package:breaking_bad_characters/data/models/characters.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.yellow, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      // to enable navigating when taping on the image!
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, characterDetailsScreen,arguments: character);
        },
        //to put the footer.
        child: GridTile(
          //for the animation when navigating "uniqe ID for each character".
          child: Hero(
            tag: character.charId,
            // to chip the photo like the container
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: character.image.isNotEmpty
              // cached network image to make the loading faster after the first run
                  ? CachedNetworkImage(
                      imageUrl: character.image,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                      placeholder: (context, url) =>
                          Image.asset('assets/images/loading.gif'),
                    )
                  : Image.asset('assets/images/placeholder.gif'),
            ),
          ),
          // clipping the bottom edges of the footer so it matches the image
          footer: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                character.name,
                style: const TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: MyColors.myWhite,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
