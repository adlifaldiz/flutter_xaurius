import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';
import 'package:get/get.dart';
import 'package:simple_tooltip/simple_tooltip.dart';

class XauToolTip extends StatelessWidget {
  final Widget child;
  final String text;
  final bool show;
  final int animationDuration;
  final EdgeInsets ballonPadding;
  final int arrowLength;
  final double maxWidth;
  final double maxHeight;

  const XauToolTip(
      {@required this.child,
      this.text,
      @required this.show,
      this.animationDuration,
      this.ballonPadding,
      this.arrowLength,
      this.maxWidth,
      this.maxHeight});
  @override
  Widget build(BuildContext context) {
    return SimpleTooltip(
      content: Text(
        text ?? "here",
        style: TextStyle(color: textWhiteColor, fontSize: 14, fontWeight: FontWeight.normal, decoration: TextDecoration.none),
      ),
      arrowLength: arrowLength ?? percentHeight(context, 2),
      maxWidth: maxWidth ?? Get.width / 2,
      maxHeight: maxHeight,
      backgroundColor: backgroundPanelColor,
      borderColor: backgroundPanelColor,
      ballonPadding: ballonPadding ?? EdgeInsets.symmetric(horizontal: percentWidth(context, 1)),
      animationDuration: Duration(seconds: animationDuration ?? 1),
      show: show ?? true,
      tooltipDirection: TooltipDirection.vertical,
      child: child,
    );
  }
}
