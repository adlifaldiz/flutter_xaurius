import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/widget/xau_text_field.dart';

class DataPersonalScreen extends StatefulWidget {
  @override
  _DataPersonalScreenState createState() => _DataPersonalScreenState();
}

class _DataPersonalScreenState extends State<DataPersonalScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Data Personal'),
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
                  labelText: 'Alamat email',
                ),
                SizedBox(height: 10),
                XauTextField(
                  useObscure: false,
                  validator: null,
                  controller: null,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  labelText: 'Nama lengkap (KTP)',
                ),
                SizedBox(height: 10),
                XauTextField(
                  useObscure: false,
                  validator: null,
                  controller: null,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  labelText: 'Nomor telepon',
                ),
                SizedBox(height: 10),
                XauTextField(
                  useObscure: false,
                  validator: null,
                  controller: null,
                  keyboardType: TextInputType.datetime,
                  maxLines: 1,
                  labelText: 'Tanggal lahir',
                ),
                SizedBox(height: 10),
                XauTextField(
                  useObscure: false,
                  validator: null,
                  controller: null,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  labelText: 'Alamat rumah',
                ),
                SizedBox(height: 10),
                XauTextField(
                  useObscure: false,
                  validator: null,
                  controller: null,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  labelText: 'Kota',
                ),
                SizedBox(height: 10),
                XauTextField(
                  useObscure: false,
                  validator: null,
                  controller: null,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  labelText: 'Kode pos',
                ),
                SizedBox(height: 10),
                XauTextField(
                  useObscure: false,
                  validator: null,
                  controller: null,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  labelText: 'Negara',
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
      ),
    );
  }
}
