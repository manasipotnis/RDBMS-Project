import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/books.dart';
import './add_books_screen.dart';
import '../widgets/book_item.dart';

class AllBooksScreen extends StatefulWidget {
  @override
  _AllBooksScreenState createState() => _AllBooksScreenState();
}

class _AllBooksScreenState extends State<AllBooksScreen> {
  @override
  Widget build(BuildContext context) {
    final booksData = Provider.of<Books>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Books'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddBookScreen.routeName);
        },
        child: Icon(Icons.add_box),
      ),
      body: Consumer<Books>(
        child: Center(
          child: Text('No books to display'),
        ),
        builder: (ctx, b, child) => b.allBooks.length == 0
            ? child
            : ListView.builder(
                itemCount: booksData.allBooks.length,
                itemBuilder: (ctx, index) => BookItem(
                  title: booksData.allBooks[index].title,
                  author: booksData.allBooks[index].author,
                  genre: booksData.allBooks[index].genre,
                  index: index + 1,
                  id: booksData.allBooks[index].id,
                ),
              ),
      ),
    );
  }
}
