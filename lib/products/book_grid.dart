import 'package:book/provider/books.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/product_item.dart';

class BookGrid extends StatelessWidget {
  const BookGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final booksData = Provider.of<Books>(context);
    final books = booksData.books;

    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10),
        itemCount: books.length,
        itemBuilder: (buildcontext, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChangeNotifierProvider.value(
                // ignore: prefer_const_constructors
                value: books[index],
                child: const ProductItem()),
          );
        });
  }

}
