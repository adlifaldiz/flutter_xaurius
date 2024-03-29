import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';

class XauriusContainerList extends StatelessWidget {
  final Widget child;
  final BoxDecoration decoration;
  final EdgeInsets padding;

  const XauriusContainerList({@required this.child, this.decoration, this.padding});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: percentWidth(context, 1), vertical: percentHeight(context, 0.5)),
      foregroundDecoration: decoration,
      width: percentWidth(context, 100),
      decoration: BoxDecoration(
        color: backgroundPanelColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
