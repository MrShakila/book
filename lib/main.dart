import 'package:book/admin/upload_book_screen.dart';
import 'package:book/screens/book_detail.dart';
import 'package:book/screens/cart_screen.dart';
import 'package:book/screens/order_screens.dart';
import 'package:book/screens/product_overview.dart';
import 'package:book/provider/books.dart';
import 'package:book/provider/cart.dart';
import 'package:book/provider/order.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //hold

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return Books();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return Cart();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return Orders();
          },
        )
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.amber),
        debugShowCheckedModeBanner: false,
        home: const ProductOverview(),
        routes: {
          ProductOverview.routeName: (context) => const ProductOverview(),
          BookDeatail.routeName: (context) => const BookDeatail(),
          CartScreen.routeName: ((context) => const CartScreen()),
          MyOrders.routeName: ((context) => const MyOrders()),
          SaveBookInfo.routeName: ((context) => const SaveBookInfo())
        },
      ),
    );
  }
}
