import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopUpDetailScreen extends StatefulWidget {
  @override
  _TopUpDetailScreenState createState() => _TopUpDetailScreenState();
}

class _TopUpDetailScreenState extends State<TopUpDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank BNI'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/item2.png',
                  fit: BoxFit.contain,
                  width: percentWidth(context, 50),
                ),
              ),
              SizedBox(height: 10),
              Text('Atas nama: Andhika sujatmiko'),
              SizedBox(height: 5),
              Text('Minimum Top up: Rp.20,000.00'),
              SizedBox(height: 5),
              Text('Biaya Top up: Rp.10,000.00'),
              SizedBox(height: 30),
              ExpansionTile(
                title: Text("ATM Bersama"),
                // tilePadding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                // childrenPadding: EdgeInsets.zero,
                collapsedIconColor: brokenWhiteColor,
                collapsedTextColor: brokenWhiteColor,
                collapsedBackgroundColor: backgroundColor,
                iconColor: primaryColor,
                textColor: primaryColor,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: percentWidth(context, 100),
                      padding: EdgeInsets.all(percentWidth(context, 5)),
                      decoration: BoxDecoration(color: backgroundPanelColor, borderRadius: BorderRadius.circular(10)),
                      child: Column(children: [Text('Lorem ipsum dolor sit amet, ')]),
                    ),
                  )
                ],
              ),
              ExpansionTile(
                title: Text("Internet Banking"),
                // tilePadding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                // childrenPadding: EdgeInsets.zero,
                collapsedIconColor: brokenWhiteColor,
                collapsedTextColor: brokenWhiteColor,
                collapsedBackgroundColor: backgroundColor,
                iconColor: primaryColor,
                textColor: primaryColor,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: percentWidth(context, 100),
                      padding: EdgeInsets.all(percentWidth(context, 5)),
                      decoration: BoxDecoration(color: backgroundPanelColor, borderRadius: BorderRadius.circular(10)),
                      child: Column(children: [Text('Lorem ipsum dolor sit amet, ')]),
                    ),
                  )
                ],
              ),
              ExpansionTile(
                title: Text("M-Banking"),
                // tilePadding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                // childrenPadding: EdgeInsets.zero,
                collapsedIconColor: brokenWhiteColor,
                collapsedTextColor: brokenWhiteColor,
                collapsedBackgroundColor: backgroundColor,
                iconColor: primaryColor,
                textColor: primaryColor,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: percentWidth(context, 100),
                      padding: EdgeInsets.all(percentWidth(context, 5)),
                      decoration: BoxDecoration(color: backgroundPanelColor, borderRadius: BorderRadius.circular(10)),
                      child: Column(children: [Text('Lorem ipsum dolor sit amet, ')]),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
