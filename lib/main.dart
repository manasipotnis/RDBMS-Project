import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/first_screen.dart';
import './screens/all_books_screen.dart';
import './providers/books.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Books(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.indigo,
          primaryColor: Colors.black,
          accentColor: Colors.deepOrangeAccent,
        ),
        home: FirstScreen(),
        routes: {
          AllBooksScreen.routeName: (ctx) => AllBooksScreen(),
        },
      ),
    );
  }
}
