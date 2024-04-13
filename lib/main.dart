import 'package:devsync/view/routes/routing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dev_sync',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: CustomColors.backgroundColor,
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.jetBrainsMono(
            fontSize: 64,
            fontWeight: FontWeight.w600,
            color: CustomColors.textColor1,
          ),
          headlineMedium: GoogleFonts.jetBrainsMono(
            fontSize: 36,
            fontWeight: FontWeight.w600,
            color: CustomColors.textColor1,
          ),
          labelLarge: GoogleFonts.adventPro(
            fontSize: 40,
            fontWeight: FontWeight.w600,
            color: CustomColors.primaryColor,
          ),
          labelMedium: GoogleFonts.roboto(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: CustomColors.textColor1,
          ),
          bodyMedium: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: CustomColors.primaryColor,
          ),
          bodySmall: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: CustomColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
