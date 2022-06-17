import 'package:book/provider/books.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDeatail extends StatelessWidget {
  const BookDeatail({
    Key? key,
  }) : super(key: key);

  static const routeName = '/book-detail';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final String bookId = ModalRoute.of(context)!.settings.arguments as String;
    final book = Provider.of<Books>(context).findById(bookId);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            book.title,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
          ]),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Hero(
                tag: book.id,
                child: Image.network(
                  book.imageUrl,
                  width: size.width,
                  fit: BoxFit.contain,
                ),
              )),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.author,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const HeightBOX(),
                      Text(
                        book.description,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const HeightBOX(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Price \$" + book.price.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.shopping_cart,
                              ))
                        ],
                      ),
                      const HeightBOX(),
                      ElevatedButton(
                          onPressed: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            width: double.infinity,
                            child: const Center(child: Text("Buy Now")),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeightBOX extends StatelessWidget {
  const HeightBOX({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10,
    );
  }
}
