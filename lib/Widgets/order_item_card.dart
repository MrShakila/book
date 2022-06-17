import 'dart:math';

import 'package:flutter/Material.dart';
import 'package:intl/intl.dart';

import '../provider/order.dart';

class OrderItemCard extends StatefulWidget {
  const OrderItemCard({
    Key? key,
    required this.orderItem,
  }) : super(key: key);

  final OrderItem orderItem;

  @override
  State<OrderItemCard> createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  // ignore: prefer_final_fields
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        ListTile(
            title: Text("Totall : ${widget.orderItem.amount}"),
            subtitle: Text(
                DateFormat('dd/MM/yyyy').format(widget.orderItem.dateTime)),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
            )),
        if (_isExpanded)
          SizedBox(
              height: min(widget.orderItem.books.length * 20 + 100, 100),
              child: ListView.builder(
                itemCount: widget.orderItem.books.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.orderItem.books[index].title),
                          Text(
                              "Price : ${widget.orderItem.books[index].price}X: ${widget.orderItem.books[index].quantity}"),
                          // Text("),
                        ],
                      ),
                    ),
                  );
                },
              ))
      ]),
    );
  }
}
