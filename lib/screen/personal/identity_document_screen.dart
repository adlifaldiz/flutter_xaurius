import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/widget/xau_text_field.dart';

class IdentityScreen extends StatefulWidget {
  @override
  _IdentityScreenState createState() => _IdentityScreenState();
}

class _IdentityScreenState extends State<IdentityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dokumen Identitas'),
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
                labelText: 'Tipe identitas',
              ),
              SizedBox(height: 10),
              XauTextField(
                useObscure: false,
                validator: null,
                controller: null,
                keyboardType: TextInputType.text,
                maxLines: 1,
                labelText: 'Nomor identitas',
              ),
              SizedBox(height: 10),
              XauTextField(
                useObscure: false,
                validator: null,
                controller: null,
                keyboardType: TextInputType.number,
                maxLines: 1,
                labelText: 'File identitas',
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
