import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';

class XauriusContainer extends StatelessWidget {
  final Widget child;

  const XauriusContainer({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 2)),
      width: percentWidth(context, 100),
      decoration: BoxDecoration(
        color: backgroundPanelColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
