import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rdbms_project/screens/edit_book_screen.dart';

import './screens/add_books_screen.dart';
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
          scaffoldBackgroundColor: Colors.yellow,
          primaryColor: Colors.black,
          accentColor: Colors.deepOrangeAccent,
        ),
        routes: {
          '/': (ctx) => AllBooksScreen(),
          AddBookScreen.routeName: (ctx) => AddBookScreen(),
          EditBookScreen.routeName: (ctx) => EditBookScreen(),
        },
      ),
    );
  }
}
