import 'package:flutter/Material.dart';

class Custom_Cart_Item extends StatelessWidget {
  const Custom_Cart_Item({
    Key? key,
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  }) : super(key: key);

  final String id;
  final String title;
  final int quantity;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 20),
                ),
                Text(
                  "Price \$" + price.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Quantity " + quantity.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Totall Price \$${price * quantity}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
