import 'package:flutter/material.dart';

class Book {
  final String id;
  final String title;
  final String author;
  final String genre;

  Book({
    @required this.id,
    @required this.title,
    @required this.author,
    @required this.genre,
  });
}
