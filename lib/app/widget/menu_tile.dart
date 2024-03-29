import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final String title;
  final double iconSize;
  final TextStyle style;
  final Widget icons;
  final Widget suffix;

  MenuTile({this.icon, this.color, this.onTap, this.title, this.iconSize = 24, this.style, this.icons, this.suffix});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap ?? null,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: percentHeight(context, 1)),
        padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 3), vertical: percentHeight(context, 0.5)),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                icons ?? FaIcon(icon, color: color ?? primaryColor, size: iconSize ?? 20),
                SizedBox(width: 16),
                Text(title, style: style ?? stylePrimary)
              ],
            ),
            suffix ?? Column()
          ],
        ),
      ),
    );
  }
}
