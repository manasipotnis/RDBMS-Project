import 'package:flutter/material.dart';

import '../helpers/DB_helper.dart';
import '../models/book.dart';

class Books with ChangeNotifier {
  final dbHelper = DBHelper.instance;

  List<Book> _allBooks = [];

  List<Book> get allBooks {
    return [..._allBooks];
  }

  void addBook(Book book) async {
    final newid = DateTime.now().toString().substring(0,19);
    print(newid);

    final newBook = Book(
      id: newid,
      title: book.title,
      author: book.author,
      genre: book.genre,
    );
    _allBooks.add(newBook);
    notifyListeners();
    Map<String, dynamic> row = {
      DBHelper.columnId: book.id,
      DBHelper.columnTitle: book.title,
      DBHelper.columnAuthor: book.author,
      DBHelper.columnGenre: book.genre
    };
    final id = await dbHelper.insert(row);
    print('Inserted row id: $id');
    _query();
  }

  void removeBook(int index, String id) async {
    //final id2 = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    print('Deleted $rowsDeleted row(s): row $id');
    _query();
    if (rowsDeleted > 0) {
      _allBooks.removeAt(index);
      notifyListeners();
    }
  }

  void updateBook(String id, Book nbook) async {
    Map<String, dynamic> row = {
      DBHelper.columnId: nbook.id,
      DBHelper.columnTitle: nbook.title,
      DBHelper.columnAuthor: nbook.author,
      DBHelper.columnGenre: nbook.genre,
    };
    print(nbook.id);
    final rowsAffected = await dbHelper.update(row);
    print('Updated $rowsAffected row(s)');
    _query();
    if (rowsAffected > 0) {
      final bookIndex = _allBooks.indexWhere((element) => element.id == id);
      _allBooks[bookIndex] = nbook;
      notifyListeners();
    }
  }

  Book findById(String id) {
    return _allBooks.firstWhere((element) => element.id == id);
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('Rows present currently : ');
    allRows.forEach((row) => print(row));
  }

  Future<void> fetchAndSetBooks() async {
    _query();
    print('fetched1');
    final dataList = await dbHelper.queryAllRows();
    print('fetched2');
    _allBooks = dataList
        .map((item) => Book(
              id: item['id'],
              title: item['title'],
              author: item['author'],
              genre: item['genre'],
            ))
        .toList();
    notifyListeners();
    print('fetched3');
  }
}
