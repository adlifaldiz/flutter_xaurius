import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';

class MenuTransaction extends StatelessWidget {
  final VoidCallback onTap;
  final String labelTxt;
  final Widget menuIcon;
  final TextStyle labelStyle;

  const MenuTransaction({@required this.labelTxt, @required this.menuIcon, @required this.onTap, this.labelStyle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: percentWidth(context, 27),
        height: percentHeight(context, 15),
        decoration: BoxDecoration(color: backgroundPanelColor.withOpacity(0.5), borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            menuIcon,
            SizedBox(height: 10),
            Text(
              labelTxt,
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              style: labelStyle ??
                  TextStyle(
                    color: brokenWhiteColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
