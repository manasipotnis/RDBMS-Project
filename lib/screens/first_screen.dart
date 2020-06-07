import 'package:flutter/material.dart';

//import '../screens/all_books_screen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String circularBooksUrl =
        'https://freesvg.org/img/Radial-Bookshelves-2.png';
    return Scaffold(
      //appBar: AppBar(title: Text('Book Tracker')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: 200,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('All Books'),
              onPressed: () {
                //Navigator.of(context).pushNamed(AllBooksScreen.routeName);
              },
            ),
          ),
          Image.network(circularBooksUrl),
          SizedBox(
            width: 200,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Add new Book'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
