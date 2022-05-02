// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breaking_bad_characters/constants/my_colors.dart';
import 'package:breaking_bad_characters/constants/strings.dart';
import 'package:flutter/material.dart';

import 'package:breaking_bad_characters/app_router.dart';

void main() {
  runApp(BreakingBapApp(appRouter: AppRouter(),));
}

class BreakingBapApp extends StatelessWidget {
  const BreakingBapApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: charactersScreen,
      theme: ThemeData(
        //Changing the overscroll glow effect color.
        colorScheme: ColorScheme.fromSwatch( 
          accentColor: MyColors.myYellow
        )
      ),
    );
  }
}
