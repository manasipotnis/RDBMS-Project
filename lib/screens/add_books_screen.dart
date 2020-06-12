import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../providers/books.dart';

class AddBookScreen extends StatefulWidget {
  static const routeName = '/add-book';

  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _form = GlobalKey<FormState>();

  final _aFNFocusNode = FocusNode();

  final _genreFocusNode = FocusNode();

  //DateTime _selectedDate;

  var newBook = Book(
    id: null,
    title: '',
    author: '',
    genre: '',
  );

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    print(newBook.title);
    print(newBook.author);
    print(newBook.genre);
    Provider.of<Books>(context, listen: false).addBook(newBook);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    super.dispose();
    _aFNFocusNode.dispose();
    _genreFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Book'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (val) {
                  FocusScope.of(context).requestFocus(_aFNFocusNode);
                },
                onSaved: (val) {
                  newBook = Book(
                    id: DateTime.now().toString(),
                    title: val,
                    author: newBook.author,
                    genre: newBook.genre,
                  );
                },
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Enter a valid title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                focusNode: _aFNFocusNode,
                decoration: InputDecoration(labelText: 'Author Name'),
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (val) {
                  FocusScope.of(context).requestFocus(_genreFocusNode);
                },
                onSaved: (val) {
                  newBook = Book(
                    id: DateTime.now().toString(),
                    title: newBook.title,
                    author: val,
                    genre: newBook.genre,
                  );
                },
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Enter a valid author name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                focusNode: _genreFocusNode,
                decoration: InputDecoration(labelText: 'Genre'),
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                onSaved: (val) {
                  newBook = Book(
                    id: DateTime.now().toString(),
                    title: newBook.title,
                    author: newBook.author,
                    //authorLname: val,
                    genre: val,
                    //finishedReading: newBook.finishedReading,
                  );
                },
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Enter a valid genre';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Text('Add Book'),
                onPressed: () {
                  _saveForm();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
