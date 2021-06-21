import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/modules/topup/top_up_detail_screen.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';

import 'package:flutter_xaurius/widget/xau_container.dart';
import 'package:flutter_xaurius/widget/xaurius_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TopUpScreen extends StatelessWidget {
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
                        onTap: () => Get.to(TopUpDetailScreen()),
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
