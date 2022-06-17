import 'package:flutter/Material.dart';

import '../screens/cart_screen.dart';

class Cart_icon extends StatelessWidget {
  const Cart_icon({
    Key? key,
    required this.value,
  }) : super(key: key);
  final String value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: (() {
              Navigator.pushNamed(context, CartScreen.routeName);
            }),
            icon: const Icon(Icons.shopping_cart)),
        Positioned(
          top: 7,
          right: 7,
          child: Container(
            width: 15,
            height: 15,
            child: Center(child: Text(value)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: Colors.white),
          ),
        ),
      ],
    );
  }
}
