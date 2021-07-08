import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/intl_formats.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/widget/empty_state.dart';
import 'package:flutter_xaurius/app/widget/shimmer_list.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../controllers/topup_history_controller.dart';

class TopupHistoryView extends GetView<TopupHistoryController> {
  final GlobalKey<LiquidPullToRefreshState> refreshHistory = GlobalKey<LiquidPullToRefreshState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidPullToRefresh(
        color: backgroundPanelColor,
        backgroundColor: primaryColor,
        key: refreshHistory,
        onRefresh: controller.onRefresh,
        showChildOpacityTransition: false,
        child: Obx(
          () {
            if (controller.isLoading.value && controller.listTopTup.length == 0) {
              return AbsorbPointer(absorbing: true, child: ShimmerList());
            }
            if (controller.listTopTup.isEmpty) {
              return EmptyState(
                refreshAble: true,
                onPressed: () => controller.onRefresh(),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 1)),
                    controller: controller.scrollController,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: controller.listTopTup.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: percentWidth(context, 1)),
                        child: GestureDetector(
                          onTap: () async => await Get.toNamed(
                            Routes.TOP_UP_DETAIL,
                            arguments: controller.listTopTup[index].invoiceId,
                          ),
                          child: XauriusContainer(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Invoice',
                                          style: textTitle,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '#' + controller.listTopTup[index].invoiceId.toString(),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      controller.listTopTup[index].depoidrStatus.toString(),
                                      style: textTitle.copyWith(color: primaryColor),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total ',
                                      style: stylePrimary,
                                    ),
                                    Text(
                                      customCurrency(controller.listTopTup[index].depoidrAmount) + ' IDR',
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                AnimatedContainer(
                  height: controller.isLoading.value ? percentHeight(context, 2) : 0,
                  duration: Duration(milliseconds: 100),
                  child: controller.isLoading.value ? CupertinoActivityIndicator() : Container(),
                )
                // controller.isLoading.value ? CupertinoActivityIndicator() : Container()
              ],
            );
          },
        ),
      ),
    );
  }
}
