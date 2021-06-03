import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/top_up_controller.dart';

class TopUpView extends GetView<TopUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Up'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 2)),
          child: XauriusContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pilih metode pembayaran',
                    style: textTitle,
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: percentHeight(context, 1)),
                          child: GestureDetector(
                            onTap: () => Get.toNamed(Routes.TOP_UP_DETAIL),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: percentHeight(context, 1), horizontal: percentWidth(context, 1)),
                              decoration: BoxDecoration(
                                  border: Border.all(color: brokenWhiteColor.withOpacity(0.3), width: 1), borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/images/item2.png',
                                          fit: BoxFit.contain,
                                          width: 70,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Bank BNI',
                                        style: textTitle,
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    FontAwesomeIcons.chevronRight,
                                    color: textWhiteColor,
                                    size: 14,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
