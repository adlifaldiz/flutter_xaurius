import 'package:flutter/material.dart';

class Item3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        'assets/images/item3.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
