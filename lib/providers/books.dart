import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';

class Books with ChangeNotifier{
  final List<Book> _allBooks = [];

  List<Book> get allBooks{
    return [..._allBooks];
  }

  
}