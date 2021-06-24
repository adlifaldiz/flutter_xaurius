import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';

import 'package:get/get.dart';

import '../controllers/privacy_policy_controller.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy", style: textAppbarStyleWhite),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5),
            vertical: percentWidth(context, 2)),
        child: XauriusContainer(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RichText(
                    text: TextSpan(children: [
                      TextSpan(text: 'PT Xaurius Aset Digital',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                          '("Company," "our," "we") understands the importance of privacy, especially when it comes to your personal information. Data privacy and your trust are our top priorities, and in this Privacy Policy we explain what information we collect from you when you register to our website (the "Application") and use our online asset tokenization platform (the "Platform"). Please read this policy carefully to understand our policies and practices regarding your information, as you agree to this Privacy Policy by using the Platform. '),
                      TextSpan(
                          text: 'If you do not agree with our policies and practices, do not use the Platform. ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'This Privacy Policy is part of our (TERMS OF USE (link needed)) available.')
                    ])),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'What Information Does XAURIUS Collect From You?',
                  style: stylePrimary.copyWith(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                    'We collect several types of information from and about users of the Platform and Application, including:\n'
                        '1.	Your personal information (such as your name, address, phone number, and email address).\n'
                        '2.	Your financial information, such as bank accounts and/or cryptocurrency wallet addresses.\n'
                        '3.	Your information that is needed to complete a Know Your Customer (KYC) & Anti-money Laundering (AML) check.\n'
                        '4.	Any other information you voluntarily provide on the Platform or Application in the ordinary course of the continuation of the relationship.\n'
                        '5.	Information about your internet connection, the equipment you use to access the Platform, Application, as well as Platform and Application usage details.\n',
                    style: stylePrimary),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'How Does XAURIUS Collect Your Information?',
                  style: stylePrimary.copyWith(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                    'We collect information from you in two ways:\n'
                        '1.	First, we collect information directly from you when you provide it to us, such as signing up for an account, or entering information into the Platform or Application when prompted/asked.\n'
                        '2.	Second, we collect generic information about your usage and equipment automatically as you navigate through the Platform and Application, such as usage details, IP addresses, web browser preferences, and information collected through cookies and other tracking technologies. We do not correlate tracking information to individuals, but some information collected, such as IP addresses, will be unique.\n',
                    style: stylePrimary),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'How Does XAURIUS Use Your Information?',
                  style: stylePrimary.copyWith(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                    'We use information that we collect about you or that you provide to us, including personal information, for the following uses:\n'
                        '1.	To continue the daily operation of the services and facilities provided to customers.\n'
                        '2.	To notify you about changes to the Platform and Application or any products or services we offer or provide though them.\n'
                        '3.	To provide you with information, products, or services that you request from us.\n'
                        '4.	To verify the information that you provide, and validate you through the KYC/AML process required by us and our fiduciary partners.\n'
                        '5.	To comply with required disclosure requests from regulatory or other authorities with which the Platform and Application are expected to comply.\n'
                        '6.	In any other way we may describe when you provide the information.\n',
                    style: stylePrimary),
                Text(
                  'Changes to Our Privacy Policy',
                  style: stylePrimary.copyWith(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                    'We will post any changes we make to our privacy policy on this page.',
                    style: stylePrimary),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Contact Information',
                  style: stylePrimary.copyWith(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                    'To ask questions or comment about this Privacy Policy and our privacy practices, contact us at info@xaurius.com.',
                    style: stylePrimary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
