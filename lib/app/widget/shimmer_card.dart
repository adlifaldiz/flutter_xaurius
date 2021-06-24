import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatefulWidget {
  final double height;
  final double width;

  const ShimmerCard({Key key, this.height, this.width}) : super(key: key);

  @override
  _ShimmerCardState createState() => _ShimmerCardState();
}

class _ShimmerCardState extends State<ShimmerCard> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: backgroundPanelColor.withOpacity(0.9),
      highlightColor: textWhiteColor.withOpacity(0.1),
      child: Container(
        width: Get.width ?? widget.width,
        height: widget.height ?? percentHeight(context, 15),
        decoration: BoxDecoration(color: backgroundPanelColor, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
