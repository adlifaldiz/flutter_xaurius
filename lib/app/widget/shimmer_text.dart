import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerText extends StatefulWidget {
  final double height;
  final double width;

  const ShimmerText({Key key, this.height, this.width}) : super(key: key);

  @override
  _ShimmerTextState createState() => _ShimmerTextState();
}

class _ShimmerTextState extends State<ShimmerText> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: backgroundPanelColor.withOpacity(0.9),
      highlightColor: textWhiteColor.withOpacity(0.1),
      child: Container(
        width: Get.width ?? widget.width,
        height: percentHeight(context, 2) ?? widget.height,
        decoration: BoxDecoration(color: backgroundPanelColor, borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
