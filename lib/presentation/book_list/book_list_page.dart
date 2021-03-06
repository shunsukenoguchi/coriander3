import 'package:coriander3/presentation/add_book/add_book_page.dart';
import 'package:coriander3/presentation/book_list/book_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookListPage extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<BookListPage> {
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
        floatingActionButton:
            Consumer<BookListModel>(builder: (context, model, child) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddBookPage(),
                  fullscreenDialog: true,
                ),
              );
              model.fetchBooks();
            },
          );
        }),
      ),
    );
  }
}
