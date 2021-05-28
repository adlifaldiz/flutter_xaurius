import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/model/buys/response_buys_model.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:flutter_xaurius/widget/xau_container.dart';
import 'package:flutter_xaurius/widget/xau_text_field.dart';
import 'package:flutter_xaurius/widget/xaurius_card.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuyScreen extends StatefulWidget {
  BuyScreen({Key key}) : super(key: key);

  @override
  _BuyScreenState createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  final _unitPriceControl = TextEditingController();
  final _totalControl = TextEditingController();

  SharedPreferences localStorage;

  ApiProvider service = ApiProvider();
  ResponseBuys responseBuys;
  bool _isLoading = false;
  bool _statusKyc = true;
  bool _statusKycReview = false;
  bool _isBuy = true;
  String harga = "000000";

  int _value = 1;
  String _valueIdType = 'BSC';

  _checkBuys() async {
    setState(() {
      _isLoading = true;
    });
    localStorage = await SharedPreferences.getInstance();
    try {
      responseBuys = await service.getBuys(localStorage.getString('token'));
      if (responseBuys.success) {
        setState(() {
          _unitPriceControl.text = responseBuys.data.currentGoldPrice.buy ?? '-';
        });
      } else {
        print(responseBuys);
      }
      setState(() {
        _isLoading = false;
      });
    } on TimeoutException catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    } on SocketException catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    } on Error catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _checkBuys();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Beli XAU'),
        ),
        body: _isLoading
            ? Center(
                child: JumpingDotsProgressIndicator(
                  numberOfDots: 3,
                  fontSize: 40,
                  color: primaryColor,
                ),
              )
            : SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 3)),
                    child: Column(
                      children: [
                        XauriusContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Text('Harga Terkini'),
                              // SizedBox(height: 10),
                              Text(
                                'XAU/IDR',
                                style: stylePrimary.copyWith(color: primaryColor, fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: 10),
                              Text(
                                responseBuys.data.currentGoldPrice.buy ?? '955.000',
                                style: stylePrimary.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        XauTextField(
                          useObscure: false,
                          readOnly: true,
                          labelText: 'Harga Unit (IDR/XAU)',
                          controller: _unitPriceControl,
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                          width: percentWidth(context, 100),
                          decoration:
                              BoxDecoration(color: fillColor, border: Border.all(color: brokenWhiteColor), borderRadius: BorderRadius.circular(10)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              iconEnabledColor: primaryColor,
                              iconDisabledColor: brokenWhiteColor,
                              dropdownColor: backgroundPanelColor,
                              value: _value.floor(),
                              items: [
                                DropdownMenuItem(
                                  child: Text('BSC (Binance Smart Chain)'),
                                  value: 1,
                                  onTap: () {
                                    setState(() {
                                      _valueIdType = 'BSC';
                                    });
                                  },
                                ),
                                DropdownMenuItem(
                                  child: Text('ETH (Ethereum)'),
                                  value: 2,
                                  onTap: () {
                                    setState(() {
                                      _valueIdType = 'Passport';
                                    });
                                  },
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        XauTextField(
                          useObscure: false,
                          labelText: 'Kuantitas (XAU)',
                          keyboardType: TextInputType.number,
                          controller: null,
                        ),
                        SizedBox(height: 10),
                        XauTextField(
                          useObscure: false,
                          labelText: 'Total (IDR) *min 50.000.00',
                          keyboardType: TextInputType.number,
                          controller: _totalControl,
                          onChanged: (val) {},
                        ),
                        SizedBox(height: 10),
                        XauTextField(
                          readOnly: true,
                          useObscure: false,
                          labelText: 'Harga GAS (IDR)',
                          keyboardType: TextInputType.number,
                          controller: null,
                        ),
                        SizedBox(height: 10),
                        XauTextField(
                          readOnly: true,
                          useObscure: false,
                          labelText: 'Discount (0.5%)',
                          keyboardType: TextInputType.number,
                          controller: null,
                          onChanged: (val) {},
                        ),
                        SizedBox(height: 20),
                        XauriusContainer(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Sub Total'),
                                  Text('0 IDR'),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('XAU'),
                                  Text('0 XAU'),
                                ],
                              ),
                              Divider(
                                height: 20,
                                thickness: 2,
                                color: primaryColor.withOpacity(0.5),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total Pembyaran'),
                                  Text('0 IDR'),
                                ],
                              ),
                              SizedBox(height: 30),
                              RaisedButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                color: primaryColor,
                                child: Container(
                                  width: percentWidth(context, 100),
                                  child: Center(
                                      child: Text(
                                    'Bayar Sekarang',
                                    style: buttonStyle,
                                  )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
