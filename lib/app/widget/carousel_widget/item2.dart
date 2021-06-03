import 'package:flutter/material.dart';

class Item2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        'assets/images/item2.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
