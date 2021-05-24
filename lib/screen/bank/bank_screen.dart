import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/widget/xau_text_field.dart';

class BankScreen extends StatefulWidget {
  @override
  _BankScreenState createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 2)),
          child: Column(
            children: [
              XauTextField(
                useObscure: false,
                validator: null,
                controller: null,
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                labelText: 'Nama Bank',
              ),
              SizedBox(height: 10),
              XauTextField(
                useObscure: false,
                validator: null,
                controller: null,
                keyboardType: TextInputType.text,
                maxLines: 1,
                labelText: 'Nama Akun Bank',
              ),
              SizedBox(height: 10),
              XauTextField(
                useObscure: false,
                validator: null,
                controller: null,
                keyboardType: TextInputType.number,
                maxLines: 1,
                labelText: 'Nomor Akun Bank',
              ),
              SizedBox(height: 30),
              RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: primaryColor,
                child: Center(
                  child: Text(
                    'Simpan',
                    style: buttonStyle,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
