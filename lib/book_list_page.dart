import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coriander3/book_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookList extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<BookList> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('books').snapshots();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBooks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本一覧'),
        ),
        body: Consumer<BookListModel>(builder: (context, model, child) {
          final books = model.bookList;
          final listTitles =
              books.map((book) => ListTile(title: Text(book.title))).toList();
          return ListView(
            children: listTitles,
          );
        }),
      ),
    );
  }
}
