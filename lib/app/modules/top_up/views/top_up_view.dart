import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xaurius/app/data/model/depoidr_data/depoird_data.dart';
import 'package:flutter_xaurius/app/data/model/top_up/resp_list_topup/resp_list_top.dart';
import 'package:flutter_xaurius/app/helpers/regex_rule.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/helpers/validator.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/widget/shimmer_card.dart';
import 'package:flutter_xaurius/app/widget/shimmer_list.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';
import 'package:flutter_xaurius/app/widget/xau_text_field.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../controllers/top_up_controller.dart';

class TopUpView extends GetView<TopUpController> {
  final GlobalKey<LiquidPullToRefreshState> refreshTopUp =
      GlobalKey<LiquidPullToRefreshState>();
  var mode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Top Up'),
        ),
        body: Obx(() {
          return SafeArea(
            child: LiquidPullToRefresh(
              color: backgroundPanelColor,
              backgroundColor: primaryColor,
              key: refreshTopUp,
              onRefresh: controller.onRefresh,
              showChildOpacityTransition: false,
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      final GlobalKey<FormState> formKey =
                          GlobalKey<FormState>();

                      if (index == 0) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: percentWidth(context, 5),
                              vertical: percentHeight(context, 1)),
                          child: controller.isLoading.value ||
                                  controller.isLoadingList.value
                              ? ShimmerCard(height: percentHeight(context, 25))
                              : XauriusContainer(
                                  child: Form(
                                    key: formKey,
                                    autovalidateMode: mode,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Top Up IDR',
                                          style: textTitle,
                                        ),
                                        SizedBox(height: 20),
                                        Obx(() {
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    percentWidth(context, 5)),
                                            width: percentWidth(context, 100),
                                            decoration: BoxDecoration(
                                                color: fillColor,
                                                border: Border.all(
                                                    color: brokenWhiteColor),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                iconEnabledColor: primaryColor,
                                                iconDisabledColor:
                                                    brokenWhiteColor,
                                                dropdownColor:
                                                    backgroundPanelColor,
                                                value: controller
                                                    .merchantId.value
                                                    .toString(),
                                                items: controller.listMerchant
                                                    .map<
                                                        DropdownMenuItem<
                                                            String>>((element) {
                                                  return new DropdownMenuItem(
                                                    child: Text(
                                                        element.merchantName),
                                                    value: element.merchantId
                                                        .toString(),
                                                  );
                                                }).toList(),
                                                onChanged: (value) {
                                                  controller.merchantId.value =
                                                      value.toString();
                                                },
                                              ),
                                            ),
                                          );
                                        }),
                                        SizedBox(height: 10),
                                        XauTextField(
                                          useObscure: false,
                                          controller:
                                              controller.nominalTopUpControl,
                                          // inputFormatters: [WhitelistingTextInputFormatter(RegExp(numberValidationRule))],
                                          validator: (value) {
                                            return validateNominalTopTup(
                                                controller.nominalTopUpControl);
                                          },
                                          prefixIcon: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('Rp'),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 30),
                                        Obx(() {
                                          if (controller.isLoadingForm.value) {
                                            return JumpingDotsProgressIndicator(
                                              color: primaryColor,
                                              fontSize: 40,
                                            );
                                          }
                                          return Container(
                                            width: Get.width,
                                            // ignore: deprecated_member_use
                                            child: RaisedButton(
                                              color: accentColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12),
                                                child: Text('next_btn'.tr,
                                                    style: buttonStyle),
                                              ),
                                              onPressed: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                final isValid = formKey
                                                    .currentState
                                                    .validate();
                                                if (!isValid) {
                                                  mode = AutovalidateMode
                                                      .onUserInteraction;
                                                  return;
                                                }
                                                formKey.currentState.save();
                                                controller.postTopUp();
                                              },
                                            ),
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                ),
                        );
                      } else {
                        final Depoidr depoList =
                            controller.listTopTup.value[index - 1];

                        return controller.isLoading.value ||
                                controller.isLoadingList.value
                            ? ShimmerList(itemCount: 6)
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: percentWidth(context, 5),
                                    vertical: percentHeight(context, 1)),
                                child: InkWell(
                                  onTap: () => Get.toNamed(Routes.TOP_UP_DETAIL,
                                      arguments: depoList.invoiceId),
                                  child: XauriusContainer(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Invoice #' +
                                                  depoList.invoiceId.toString(),
                                              style: textTitle,
                                            ),
                                            Text(
                                              depoList.depoidrStatus,
                                              style: textTitle.copyWith(
                                                  color: primaryColor),
                                              textAlign: TextAlign.end,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Total Top up:',
                                            ),
                                            Text(
                                              'Rp ' + depoList.depoidrAmount,
                                              textAlign: TextAlign.end,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                      }
                    }, childCount: 1 + controller.listTopTup.length),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
