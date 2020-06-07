import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book.dart';
import '../providers/books.dart';

class EditBookScreen extends StatefulWidget {
  static const routeName = 'edit-screen';

  @override
  _EditBookScreenState createState() => _EditBookScreenState();
}

class _EditBookScreenState extends State<EditBookScreen> {
  final _form = GlobalKey<FormState>();

  final _aFNFocusNode = FocusNode();

  final _genreFocusNode = FocusNode();

  //DateTime _selectedDate;

  var _editedBook = Book(
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
    if (_editedBook.id != null) {
      Provider.of<Books>(context, listen: false)
          .updateBook(_editedBook.id, _editedBook);
    } else {
      Provider.of<Books>(context, listen: false).addBook(_editedBook);
    }
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    super.dispose();
    _aFNFocusNode.dispose();
    _genreFocusNode.dispose();
  }

  var isInit = true;

  var _initValues = {
    'title': '',
    'author': '',
    'genre': '',
  };

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      final bookId = ModalRoute.of(context).settings.arguments as String;
      if (bookId != null) {
        _editedBook = Provider.of<Books>(context).findById(bookId);
        _initValues = {
          'title': _editedBook.title,
          'author': _editedBook.author,
          'genre': _editedBook.genre,
        };
      }
    }
    isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Book'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _initValues['title'],
                decoration: InputDecoration(labelText: 'Title'),
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (val) {
                  FocusScope.of(context).requestFocus(_aFNFocusNode);
                },
                onSaved: (val) {
                  _editedBook = Book(
                    id: _editedBook.id,
                    title: val,
                    author: _editedBook.author,
                    //authorLname: _editedBook.authorLname,
                    genre: _editedBook.genre,
                    //finishedReading: _editedBook.finishedReading,
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
                initialValue: _initValues['author'],
                focusNode: _aFNFocusNode,
                decoration: InputDecoration(labelText: 'Author Name'),
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (val) {
                  FocusScope.of(context).requestFocus(_genreFocusNode);
                },
                onSaved: (val) {
                  _editedBook = Book(
                    id: _editedBook.id,
                    title: _editedBook.title,
                    author: val,
                    //authorLname: newBook.authorLname,
                    genre: _editedBook.genre,
                    //finishedReading: newBook.finishedReading,
                  );
                },
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Enter a valid author name';
                  }
                  return null;
                },
              ),

              // TextFormField(
              //   focusNode: _aLNFocusNode,
              //   decoration: InputDecoration(labelText: 'Author Last Name'),
              //   textCapitalization: TextCapitalization.words,
              //   textInputAction: TextInputAction.next,
              //   onFieldSubmitted: (val) {
              //     FocusScope.of(context).requestFocus(_genreFocusNode);
              //   },
              //   onSaved: (val) {
              //     newBook = Book(
              //       id: DateTime.now().toString(),
              //       title: newBook.title,
              //       authorFname: newBook.authorFname,
              //       //authorLname: val,
              //       genre: newBook.genre,
              //       //finishedReading: newBook.finishedReading,
              //     );
              //   },
              //   validator: (val) {
              //     if (val.isEmpty) {
              //       return 'Enter a valid last name';
              //     }
              //     return null;
              //   },
              // ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: _initValues['genre'],
                focusNode: _genreFocusNode,
                decoration: InputDecoration(labelText: 'Genre'),
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                onSaved: (val) {
                  _editedBook = Book(
                    id: _editedBook.id,
                    title: _editedBook.title,
                    author: _editedBook.author,
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
              // FlatButton.icon(
              //   onPressed: () async {
              //     await showDatePicker(
              //       context: context,
              //       initialDate: DateTime.now(),
              //       firstDate: DateTime(2000, 1),
              //       lastDate: DateTime.now(),
              //     ).then((chosenDate) {
              //       if (chosenDate == null) {
              //         return;
              //       }
              //       setState(() {
              //         _selectedDate = chosenDate;
              //       });
              //     });
              //   },
              //   icon: Icon(Icons.calendar_today),
              //   label: Text('Pick Date'),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Center(
              //   child: Container(
              //     margin: EdgeInsets.all(10),
              //     padding: const EdgeInsets.all(10),
              //     decoration: BoxDecoration(border: Border.all(width: 2)),
              //     child: _selectedDate == null
              //         ? Text('No date chosen')
              //         : Text(
              //             DateFormat.yMMMMEEEEd().format(_selectedDate),
              //           ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text('Edit Book'),
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
