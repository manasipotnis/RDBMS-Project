import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/books.dart';

class AllBooksScreen extends StatelessWidget {
  static const routeName = '/all-books';
  @override
  Widget build(BuildContext context) {
    final booksData = Provider.of<Books>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Books',
        ),
      ),
      body: booksData.allBooks.length == 0
          ? Center(
              child: Text('No books to show. Add some!', style: TextStyle(fontSize: 20), textAlign: TextAlign.end,),
            )
          : Text('Show books'),
    );
  }
}
