import 'package:book/provider/order.dart';
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';

import '../Widgets/order_item_card.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);
  static const routeName = '/MyOrder';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Now"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, index) {
          return OrderItemCard(
            orderItem: orderData.orders[index],
          );
        },
      ),
    );
  }
}
