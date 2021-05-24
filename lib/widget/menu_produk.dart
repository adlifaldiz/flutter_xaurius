import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/theme.dart';

class MenuProduk extends StatelessWidget {
  final VoidCallback onTap;
  final String labelTxt;
  final Widget menuIcon;

  const MenuProduk({@required this.labelTxt, @required this.menuIcon, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          menuIcon,
          SizedBox(height: 5),
          Text(
            labelTxt,
            overflow: TextOverflow.visible,
            style: TextStyle(
              color: brokenWhiteColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
