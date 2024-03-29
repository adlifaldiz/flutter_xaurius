import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/depoidr_data/depoird_data.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/helpers/validator.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/widget/shimmer_card.dart';
import 'package:flutter_xaurius/app/widget/shimmer_list.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';
import 'package:flutter_xaurius/app/widget/xau_text_field.dart';
import 'package:flutter_xaurius/app/widget/xaurius_button.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../controllers/top_up_controller.dart';

class TopUpView extends GetView<TopUpController> {
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
              key: controller.refreshTopUp,
              onRefresh: controller.onRefresh,
              showChildOpacityTransition: false,
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
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
                                    key: controller.formKey,
                                    autovalidateMode: controller.mode.value,
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
                                                vertical:
                                                    percentHeight(context, 0.6),
                                                horizontal:
                                                    percentWidth(context, 5)),
                                            width: percentWidth(context, 100),
                                            decoration: BoxDecoration(
                                                color: fillColor,
                                                border: Border.all(
                                                    color: brokenWhiteColor),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        percentWidth(
                                                            context, 3))),
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
                                          labelText: 'min_topup'.tr,
                                          controller:
                                              controller.nominalTopUpControl,
                                          keyboardType: TextInputType.number,
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
                                          return XauriusButton(
                                            pressAble: true,
                                            text: 'next_btn'.tr,
                                            onpressed: () {
                                              Get.focusScope.unfocus();
                                              controller.checkTopUp();
                                            },
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
