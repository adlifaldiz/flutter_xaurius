import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';

class XauriusContainer extends StatelessWidget {
  final Widget child;
  final BoxDecoration decoration;

  const XauriusContainer({@required this.child, this.decoration});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 2), vertical: percentHeight(context, 0.5)),
      foregroundDecoration: decoration,
      width: percentWidth(context, 100),
      decoration: BoxDecoration(
        color: backgroundPanelColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
