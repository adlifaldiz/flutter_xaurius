import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/widget/xaurius_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class XauAlert extends StatefulWidget {
  final String title;
  final TextStyle titleStyle;
  final String subTitle;
  final TextStyle subTitleStyle;
  final String onConfirmText;
  final TextStyle onConfirmTextStyle;
  final String onCancelText;
  final TextStyle onCancelTextStyle;
  final Icon icon;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final bool isAlert;
  final bool isDismissable;

  const XauAlert(
      {Key key,
      this.title,
      this.titleStyle,
      this.subTitle,
      this.subTitleStyle,
      this.icon,
      this.onConfirm,
      this.onCancel,
      this.onConfirmText,
      this.onConfirmTextStyle,
      this.onCancelText,
      this.onCancelTextStyle,
      this.isAlert,
      this.isDismissable})
      : super(key: key);
  @override
  _XauAlertState createState() => _XauAlertState();
}

class _XauAlertState extends State<XauAlert> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationCurve: Curves.bounceIn,
      backgroundColor: Colors.transparent,
      child: XauriusCard(
        child: Container(
          color: brokenWhiteColor.withOpacity(0.2),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: widget.isDismissable ?? false,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.close,
                        color: textWhiteColor,
                      ),
                    ),
                  ),
                ),
              ),
              widget.icon ?? Icon(FontAwesomeIcons.checkCircle, size: 60, color: primaryColor),
              SizedBox(height: 30),
              Text(
                widget.title ?? 'Title',
                style: widget.titleStyle ?? stylePrimary.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                widget.subTitle ?? 'SubTitle',
                style: widget.subTitleStyle ?? stylePrimary,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: widget.isAlert ?? false,
                    child: FlatButton(
                      onPressed: widget.onCancel ?? () => Get.back(),
                      color: primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        widget.onCancelText ?? 'Cancel',
                        style: widget.onCancelTextStyle ?? buttonStyle,
                      ),
                    ),
                  ),
                  SizedBox(width: widget.isAlert == true ? 20 : 0),
                  FlatButton(
                    onPressed: widget.onConfirm ?? () => Get.back(),
                    color: primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      widget.onConfirmText ?? 'OK',
                      style: widget.onConfirmTextStyle ?? buttonStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:flutter_xaurius/helper/theme.dart';
// import 'package:flutter_xaurius/widget/xaurius_card.dart';
// import 'package:flutter/services.dart';

// class XauriusAlert extends StatefulWidget {
//   final String title;
//   final TextStyle titleStyle;
//   final String subTitle;
//   final TextStyle subTitleStyle;
//   final Icon icon;
//   final VoidCallback onConfirm;

//   XauriusAlert({
//     Key key,
//     this.title,
//     this.titleStyle,
//     this.subTitle,
//     this.subTitleStyle,
//     this.icon,
//     this.onConfirm,
//   }) : super(key: key);
//   @override
//   _XauriusAlertState createState() => _XauriusAlertState();
// }

// class _XauriusAlertState extends State<XauriusAlert> {
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       insetAnimationCurve: Curves.bounceIn,
//       backgroundColor: Colors.transparent,
//       child: XauriusCard(
//         child: Container(
//           color: backgroundPanelColor.withOpacity(0.3),
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               widget.icon,
//               SizedBox(height: 30),
//               Text(
//                 widget.title,
//                 style: widget.titleStyle,
//               ),
//               SizedBox(height: 10),
//               Text(
//                 widget.subTitle,
//                 style: widget.subTitleStyle,
//               ),
//               SizedBox(height: 30),
//               FlatButton(
//                   onPressed: onConfirm,
//                   color: primaryColor,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                   child: Text(
//                     'OK',
//                     style: buttonStyle,
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
