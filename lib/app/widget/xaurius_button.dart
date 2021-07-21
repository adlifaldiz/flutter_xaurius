import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';

class XauriusButton extends StatelessWidget {
  final TextStyle style;
  final VoidCallback onpressed;
  final bool pressAble;
  final String text;

  XauriusButton({this.style, this.onpressed, @required this.pressAble, @required this.text});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: !pressAble ? () {} : onpressed,
      padding: EdgeInsets.symmetric(vertical: percentHeight(context, 1.9), horizontal: percentWidth(context, 5)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(percentWidth(context, 3))),
      color: !pressAble ? disableColor : primaryColor,
      splashColor: !pressAble ? transparentColor : textWhiteColor.withOpacity(0.1),
      highlightColor: !pressAble ? transparentColor : textWhiteColor.withOpacity(0.1),
      child: Center(
        child: Text(
          text,
          style: buttonStyle,
        ),
      ),
    );
  }
}
