import 'package:book/Widgets/cart_icon.dart';
import 'package:book/admin/upload_book_screen.dart';
import 'package:book/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../products/book_grid.dart';

class ProductOverview extends StatelessWidget {
  const ProductOverview({Key? key}) : super(key: key);

  static const routeName = '/product-overview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Grid"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.upload_file),
          onPressed: () {
            Navigator.pushNamed(context, SaveBookInfo.routeName);
          },
        ),
        actions: [
          Consumer<Cart>(builder: ((context, cart, child) {
            return Cart_icon(
              value: cart.items.length.toString(),
            );
          }))
        ],
      ),
      body: const BookGrid(),
    );
  }
}
