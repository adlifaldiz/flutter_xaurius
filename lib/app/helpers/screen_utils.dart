import 'package:flutter/material.dart';

double percentWidth(BuildContext context, double percent) {
  var size = MediaQuery.of(context).size;
  return size.width / 100 * percent;
}

double percentHeight(BuildContext context, double percent) {
  var size = MediaQuery.of(context).size;
  return size.height / 100 * percent;
}

bool isLandscape(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.landscape;
}

double screenWidth(BuildContext context, {double divideBy = 1, double reduceBy = 0}){
  var width = MediaQuery.of(context).size.width;
  return (width / divideBy) - reduceBy;
}

double screenHeight(BuildContext context, {double divideBy = 1, double reduceBy = 0}){
  var height = MediaQuery.of(context).size.height;
  return (height / divideBy) - reduceBy;
}
