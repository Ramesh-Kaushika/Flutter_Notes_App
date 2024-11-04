import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/utils/router.dart';
import 'package:notes_app/utils/theme_data.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
   sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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