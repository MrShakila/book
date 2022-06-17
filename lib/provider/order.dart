import 'package:book/provider/cart.dart';
import 'package:flutter/Material.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> books;
  final DateTime dateTime;

  OrderItem(
      {required this.id,
      required this.amount,
      required this.books,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  // ignore: prefer_final_fields
  List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> books, double totalAmount) {
    _orders.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amount: totalAmount,
            books: books,
            dateTime: DateTime.now()));

    notifyListeners();
  }
}
