import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() ontap;
  final String text;
  final bool isLoading;
  const CustomButton(
      {Key? key,
      required this.ontap,
      required this.text,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Center(
              child: isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.black,
                    )
                  : Text(
                      text,
                      style: const TextStyle(color: Colors.black),
                    ),
            ),
          ),
        ));
  }
}
