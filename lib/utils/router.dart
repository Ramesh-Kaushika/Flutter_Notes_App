import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/pages/home_page.dart';
import 'package:notes_app/pages/note_page.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    debugLogDiagnostics: true,
    initialLocation: "/",
    routes: [
        //homepage
        GoRoute(
          name: "homepage",
          path: "/",
          builder:(context, state) {
            return const HomePage();
          },
          ),
          GoRoute(
          name: "create_note",
          path: "/create_note",
          builder:(context, state) {
            return const NotePage();
          },
          ),

    ],
    );

}