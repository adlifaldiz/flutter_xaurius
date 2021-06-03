import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';

import 'package:get/get.dart';

import '../controllers/deposit_controller.dart';

class DepositView extends GetView<DepositController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deposit Rupiah'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: percentWidth(context, 5),
              vertical: percentHeight(context, 2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Deposit Melalui',
                style: textTitle.copyWith(fontSize: 20),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: percentHeight(context, 1)),
                      child: XauriusContainer(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.account_balance,
                                  color: textWhiteColor,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Bank',
                                  style: textTitle,
                                )
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: textWhiteColor,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
