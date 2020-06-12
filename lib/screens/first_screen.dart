import 'package:flutter/material.dart';

import '../screens/all_books_screen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String circularBooksUrl =
        'https://fbcd.co/product-lg/6fe5b17854efbd5c5a95d203196c880f_resize.png';
    return Scaffold(
      //appBar: AppBar(title: Text('Book Tracker')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Text(
              'An app to keep track of the books you have read!',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Image.network(circularBooksUrl),
          SizedBox(
            width: 200,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text('All Books'),
              onPressed: () {
                Navigator.of(context).pushNamed(AllBooksScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
