import 'package:devsync/view/routes/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/colors.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: CustomColors.textColor1),
          backgroundColor: CustomColors.backgroundColor2,
          titleTextStyle: TextStyle(
            color: CustomColors.textColor1,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          elevation: 0,
          centerTitle: false,
        ),
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
          headlineSmall: GoogleFonts.jetBrainsMono(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: CustomColors.textColor1,
          ),
          labelLarge: GoogleFonts.adventPro(
            fontSize: 56,
            fontWeight: FontWeight.w600,
            color: CustomColors.primaryColor,
          ),
          labelMedium: GoogleFonts.roboto(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: CustomColors.textColor1,
          ),
          labelSmall: GoogleFonts.jetBrainsMono(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: CustomColors.textColor1,
          ),
          bodyLarge: GoogleFonts.roboto(
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
