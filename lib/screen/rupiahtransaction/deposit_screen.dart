import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/widget/xau_container.dart';
import 'package:flutter_xaurius/widget/xau_text_field.dart';

class DepositScreen extends StatefulWidget {
  @override
  _DepositScreenState createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deposit Rupiah'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Deposit Melalui',
                style: textTitle.copyWith(fontSize: 20),
              ),
              SizedBox(height: 20),
              XauriusContainer(
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
              ))
            ],
          ),
        ),
      ),
    );
  }
}
