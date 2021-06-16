import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatefulWidget {
  final double height;
  final double width;
  final EdgeInsets margin;

  const ShimmerList({Key key, this.height, this.width, this.margin}) : super(key: key);
  @override
  _ShimmerListState createState() => _ShimmerListState();
}

class _ShimmerListState extends State<ShimmerList> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: backgroundPanelColor.withOpacity(0.9),
      highlightColor: textWhiteColor.withOpacity(0.1),
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 20) ?? widget.margin,
              width: Get.width ?? widget.width,
              height: percentHeight(context, 10) ?? widget.height,
              decoration: BoxDecoration(color: backgroundPanelColor, borderRadius: BorderRadius.circular(20)),
            );
          }),
    );
  }
}
