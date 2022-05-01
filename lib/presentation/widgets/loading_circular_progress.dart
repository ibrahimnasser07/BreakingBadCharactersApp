import 'package:breaking_bad_characters/constants/my_colors.dart';
import 'package:flutter/material.dart';

class LoadingCircularProgressIndicator extends StatelessWidget {
  const LoadingCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }
}
