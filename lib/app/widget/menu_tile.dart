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

  MenuTile({this.icon, this.color, this.onTap, this.title, this.iconSize = 24, this.style, this.icons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: percentHeight(context, 1)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 1)),
          width: double.infinity,
          child: Row(
            children: <Widget>[
              icons ??
                  FaIcon(
                    icon,
                    color: color ?? primaryColor,
                    size: iconSize ?? 20,
                  ),
              SizedBox(
                width: 16,
              ),
              Text(title, style: style ?? stylePrimary)
            ],
          ),
        ),
      ),
    );
  }
}
