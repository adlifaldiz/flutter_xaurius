import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';
import 'package:get/get.dart';

class EmptyState extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  @required
  final bool refreshAble;

  const EmptyState({Key key, this.buttonText, this.onPressed, @required this.refreshAble}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: XauriusContainer(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/xaurius_logo_yellow.png',
                    width: percentWidth(context, 30),
                  ),
                  Text(
                    'no_data'.tr,
                    textAlign: TextAlign.center,
                    style: stylePrimary.copyWith(fontSize: 30, color: primaryColor, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 20),
                  !refreshAble
                      ? Container()
                      : FlatButton(
                          onPressed: onPressed ?? () {},
                          color: primaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            buttonText ?? 'Refresh',
                            style: buttonStyle.copyWith(fontSize: 20),
                          ),
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
