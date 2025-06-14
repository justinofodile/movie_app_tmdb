import 'package:flutter/material.dart';
import 'package:the_app/screens/home.dart';

void main() {
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moovie App',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.grey[900],
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            bodySmall: TextStyle(color: Colors.white),
          ),
          appBarTheme: const AppBarTheme(
              actionsIconTheme: IconThemeData(color: Colors.white))),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
