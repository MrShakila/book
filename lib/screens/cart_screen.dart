import 'package:book/Widgets/custom_cart_item.dart';
import 'package:book/screens/order_screens.dart';
import 'package:book/provider/cart.dart';
import 'package:book/provider/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: Custom_Cart_Item(
                      id: cart.items.values.toList()[index].id,
                      price: cart.items.values.toList()[index].price,
                      quantity: cart.items.values.toList()[index].quantity,
                      title: cart.items.values.toList()[index].title,
                    ));
              },
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Total Price ${cart.totalAmount}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Provider.of<Orders>(context, listen: false).addOrder(
                              cart.items.values.toList(), cart.totalAmount);
                          cart.clear();
                          Navigator.pushNamed(context, MyOrders.routeName);
                        },
                        child: const Text("Buy Now"))
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
