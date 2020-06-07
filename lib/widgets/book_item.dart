import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/books.dart';
import '../screens/edit_book_screen.dart';
//import 'package:intl/intl.dart';

class BookItem extends StatelessWidget {
  final String title;
  final String author;
  final String genre;
  final int index;
  final String id;
  

  BookItem({
    this.title,
    this.author,
    this.genre,
    this.index,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    final booksData = Provider.of<Books>(context);
    return Card(
        elevation: 20,
        child: ListTile(
          isThreeLine: true,
          leading: CircleAvatar(
            child: Text('$index'),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'by $author\n$genre',
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              booksData.removeBook(index-1,id);
            },
          ),
          onTap: (){
            Navigator.of(context).pushNamed(EditBookScreen.routeName, arguments: id);
          }
        ));
  }
}
//${DateFormat.yMMM().format(finishedReading)}
