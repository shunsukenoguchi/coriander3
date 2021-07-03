import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:coriander3/book.dart';

class BookListModel extends ChangeNotifier {
  List<Book> bookList = [];

  Future fetchBooks() async {
    final docs = await FirebaseFirestore.instance.collection('books').get();
    final books = docs.docs.map((doc) => Book(doc['title'])).toList();

    this.bookList = books;
    notifyListeners();
  }
}
