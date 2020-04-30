import 'package:flutter/material.dart';

class Book {
  final String id;
  final String title;
  final String authorFname;
  final String authorLname;
  final String genre;
  final DateTime finishedReading;

  Book({
    @required this.id,
    @required this.title,
    @required this.authorFname,
    @required this.authorLname,
    @required this.genre,
    @required this.finishedReading,
  });
}
