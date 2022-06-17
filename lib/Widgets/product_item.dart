import 'package:book/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/book_detail.dart';
import '../provider/book.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final book = Provider.of<Book>(context);

    return GridTile(
      header: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, BookDeatail.routeName,
              arguments: book.id);
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: Hero(
            tag: book.id,
            child: Image.network(
              book.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      child: Container(color: Colors.transparent),
      footer: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Price \$" + book.price.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              IconButton(
                  onPressed: () {
                    book.toggleFavouriteStates();
                  },
                  icon: book.isFav
                      ? const Icon(Icons.favorite, color: Colors.pink)
                      : const Icon(Icons.favorite_border, color: Colors.white)),
              IconButton(
                  onPressed: () {
                    cart.addItem(book.id, book.title, book.price);
                  },
                  icon: const Icon(Icons.shopping_cart, color: Colors.white))
            ]),
          ],
        ),
      ),
    );
  }
}
