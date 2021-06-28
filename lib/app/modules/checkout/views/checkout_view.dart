import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/widget/shimmer_card.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import 'package:flutter_xaurius/app/helpers/intl_formats.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AbsorbPointer(
        absorbing: controller.isLoadingForm.value,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Check Out'),
          ),
          body: GestureDetector(
            onTap: () => Get.focusScope.unfocus(),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 3)),
                    //   child: XauriusContainer(
                    //     child: Column(
                    //       children: [
                    //         Text(
                    //           'Contract Address',
                    //           style: textTitle,
                    //         ),
                    //         SizedBox(height: 20),
                    //         Divider(thickness: 2, height: 30, color: primaryColor),
                    //         RichText(
                    //           textAlign: TextAlign.center,
                    //           text: TextSpan(
                    //             text: 'what_is_ca'.tr,
                    //             style: stylePrimary.copyWith(fontSize: 12),
                    //             children: [
                    //               TextSpan(
                    //                 text: 'click_here_btn'.tr,
                    //                 style: stylePrimary.copyWith(
                    //                   fontSize: 12,
                    //                   color: primaryColor,
                    //                   fontWeight: FontWeight.bold,
                    //                 ),
                    //                 recognizer: new TapGestureRecognizer()..onTap = () => Get.toNamed(Routes.FAQ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         SizedBox(height: 20),
                    //         Text(
                    //           'Contract Address Ethereum',
                    //           style: textTitle,
                    //         ),
                    //         GestureDetector(
                    //           onTap: () {
                    //             successSnackbar('Copied', controller.ethAddress);
                    //             Clipboard.setData(new ClipboardData(text: controller.ethAddress));
                    //           },
                    //           child: Text(
                    //             controller.ethAddress,
                    //             textAlign: TextAlign.center,
                    //           ),
                    //         ),
                    //         SizedBox(height: 20),
                    //         Text(
                    //           'Contract Address Binance Smart Chain',
                    //           style: textTitle,
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         GestureDetector(
                    //           onTap: () {
                    //             successSnackbar('Copied', controller.bscAddress);
                    //             Clipboard.setData(new ClipboardData(text: controller.bscAddress));
                    //           },
                    //           child: Text(
                    //             controller.bscAddress,
                    //             textAlign: TextAlign.center,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 3)),
                      child: controller.isLoading.value
                          ? ShimmerCard(
                              height: percentHeight(context, 20),
                            )
                          : XauriusContainer(
                              child: Column(
                                children: [
                                  Text(
                                    'Unit',
                                    style: textTitle,
                                  ),
                                  SizedBox(height: 20),
                                  Divider(thickness: 2, height: 30, color: primaryColor),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'unit_price_buy'.tr,
                                        style: textTitle,
                                      ),
                                      Text(customCurrency(controller.responseCheckOut.value.data.buy.buyUnitPrice) + ' IDR'),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'network'.tr,
                                        style: textTitle,
                                      ),
                                      Text(controller.responseCheckOut.value.data.buy.buyNetwork),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 1)),
                      child: controller.isLoading.value
                          ? ShimmerCard(
                              height: percentHeight(context, 45),
                            )
                          : XauriusContainer(
                              child: Column(
                                children: [
                                  Text(
                                    'total_calculation'.tr,
                                    style: textTitle,
                                  ),
                                  SizedBox(height: 20),
                                  Divider(thickness: 2, height: 30, color: primaryColor),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'quantity_xau'.tr,
                                        style: textTitle,
                                      ),
                                      Text(controller.responseCheckOut.value.data.buy.buyQty + ' XAU'),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'sub_total'.tr,
                                        style: textTitle,
                                      ),
                                      Text(customCurrency(controller.responseCheckOut.value.data.buy.buyAmount, symbol: '') + ' IDR'),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'discount'.tr,
                                        style: textTitle,
                                      ),
                                      Text(customCurrency(controller.responseCheckOut.value.data.invoiceCalculation.discount) + ' IDR'),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'admin_fee'.tr,
                                        style: textTitle,
                                      ),
                                      Expanded(
                                          child: Text(
                                        customCurrency(controller.responseCheckOut.value.data.invoiceCalculation.admfee) + ' IDR',
                                        textAlign: TextAlign.end,
                                      )),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'gas_fee'.tr,
                                        style: textTitle,
                                      ),
                                      Text(customCurrency(controller.responseCheckOut.value.data.invoiceCalculation.gas) + ' IDR'),
                                    ],
                                  ),
                                  Divider(thickness: 2, height: 30, color: primaryColor),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total',
                                        style: textTitle,
                                      ),
                                      Text(customCurrency(controller.responseCheckOut.value.data.invoiceCalculation.total) + ' IDR'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 3)),
                      child: controller.isLoading.value
                          ? ShimmerCard(
                              height: percentHeight(context, 20),
                            )
                          : XauriusContainer(
                              child: Column(
                                children: [
                                  controller.auth.userVouchers.isEmpty
                                      ? Container()
                                      : Column(
                                          children: [
                                            Text(
                                              'payment'.tr,
                                              style: textTitle,
                                            ),
                                            Divider(thickness: 2, height: 30, color: primaryColor),
                                          ],
                                        ),

                                  // Form(
                                  //   key: controller.checkOutKey,
                                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                                  //   child: Column(
                                  //     children: [
                                  //       // Container(
                                  //       //   padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                                  //       //   width: percentWidth(context, 100),
                                  //       //   decoration: BoxDecoration(
                                  //       //       color: fillColor, border: Border.all(color: brokenWhiteColor), borderRadius: BorderRadius.circular(10)),
                                  //       //   child: DropdownButtonHideUnderline(
                                  //       //     child: DropdownButton(
                                  //       //       iconEnabledColor: primaryColor,
                                  //       //       iconDisabledColor: brokenWhiteColor,
                                  //       //       dropdownColor: backgroundPanelColor,
                                  //       //       value: controller.merchantId.value.toString(),
                                  //       //       items: controller.listVaMerchant.map<DropdownMenuItem<String>>((element) {
                                  //       //         return new DropdownMenuItem(
                                  //       //           child: Text(element.merchantName),
                                  //       //           value: element.merchantId.toString(),
                                  //       //         );
                                  //       //       }).toList(),
                                  //       //       onChanged: (value) {
                                  //       //         controller.merchantId.value = value;
                                  //       //       },
                                  //       //     ),
                                  //       //   ),
                                  //       // ),
                                  //       // SizedBox(height: 20),
                                  //       controller.responseCheckOut.value.data.buy.buyNetwork == 'Private'
                                  //           ? Container()
                                  //           : Column(
                                  //               children: [
                                  //                 XauTextField(
                                  //                   useObscure: false,
                                  //                   controller: controller.walletController,
                                  //                   validator: validateWallet,
                                  //                   labelText: 'wallet_address'.tr,
                                  //                 ),
                                  //                 RichText(
                                  //                   textAlign: TextAlign.center,
                                  //                   text: TextSpan(
                                  //                     text: 'wallet_address_ex'.tr,
                                  //                     style: stylePrimary.copyWith(fontSize: 12),
                                  //                     children: [
                                  //                       TextSpan(
                                  //                         text: 'here_btn'.tr,
                                  //                         style: stylePrimary.copyWith(
                                  //                           fontSize: 12,
                                  //                           color: primaryColor,
                                  //                           fontWeight: FontWeight.bold,
                                  //                         ),
                                  //                         recognizer: TapGestureRecognizer()..onTap = () => launch('https://metamask.io/download.html'),
                                  //                       ),
                                  //                     ],
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // SizedBox(height: 20),
                                  controller.auth.userVouchers.isEmpty
                                      ? Container()
                                      : Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Checkbox(
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                  checkColor: textWhiteColor,
                                                  activeColor: primaryColor,
                                                  value: controller.useVoucher.value,
                                                  onChanged: (value) {
                                                    return controller.onVoucherChange(value);
                                                  },
                                                ),
                                                Text(
                                                  !controller.useVoucher.value ? "payment_voucher_q".tr : "payment_voucher_active".tr,
                                                  style: stylePrimary,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Visibility(
                                              visible: controller.useVoucher.value,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                    color: fillColor,
                                                    border: Border.all(color: brokenWhiteColor),
                                                    borderRadius: BorderRadius.circular(10)),
                                                child: DropdownButtonHideUnderline(
                                                  child: Obx(
                                                    () => DropdownButton(
                                                      iconEnabledColor: primaryColor,
                                                      iconDisabledColor: brokenWhiteColor,
                                                      dropdownColor: backgroundPanelColor,
                                                      value: controller.voucherCode.value.toString(),
                                                      items: controller.auth.userVouchers.map<DropdownMenuItem<String>>((element) {
                                                        return DropdownMenuItem(
                                                          child: Text(element.voucherCode + ' (${formatCurrency(element.voucherValue)})'),
                                                          value: element.voucherCode,
                                                        );
                                                      }).toList(),
                                                      onChanged: (value) {
                                                        return controller.voucherCode.value = value;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                          ],
                                        ),

                                  Obx(() {
                                    if (controller.isLoadingForm.value) {
                                      return JumpingDotsProgressIndicator(color: primaryColor, fontSize: 40);
                                    }
                                    return RaisedButton(
                                      onPressed: () {
                                        Get.focusScope.unfocus();
                                        controller.checkCheckOut();
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: primaryColor,
                                      child: Container(
                                        width: percentWidth(context, 100),
                                        child: Center(
                                          child: Text(
                                            'next_btn'.tr,
                                            style: buttonStyle,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
