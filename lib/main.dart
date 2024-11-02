import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/utils/router.dart';
import 'package:notes_app/utils/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: "NotesApp",
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.darkTheme.copyWith(textTheme: GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme)) ,
    );
  }
}