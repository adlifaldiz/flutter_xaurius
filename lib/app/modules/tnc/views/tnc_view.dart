import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';

import 'package:get/get.dart';

import '../controllers/tnc_controller.dart';

class TncView extends GetView<TncController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms and Conditions", style: textAppbarStyleWhite),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentWidth(context, 2)),
        child: XauriusContainer(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  tnc_title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: brokenWhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  tnc_subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: brokenWhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //ROMAWI I
                SizedBox(height: 20),
                Text(rom_1, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(rom_1_desc, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(rom_1_num_1,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      SizedBox(height: 5),
                      Text(rom_1_num_2,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      SizedBox(height: 5),
                      Text(rom_1_num_3,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      SizedBox(height: 5),
                      Text(rom_1_num_4,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                        child: Text(rom_1_num_4_data,
                            textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      ),
                      Text(rom_1_num_6,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      SizedBox(height: 5),
                      Text(rom_1_num_7,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                    ],
                  ),
                ),
                Text(rom_1_desc, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),

                //ROMAWI II
                SizedBox(height: 20),
                Text(rom_2, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(rom_2_desc, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(rom_2_num_1,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      SizedBox(height: 5),
                      Text(rom_2_num_2,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      SizedBox(height: 5),
                      Text(rom_2_num_3,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      SizedBox(height: 5),
                      Text(rom_2_num_4,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      SizedBox(height: 5),
                      Text(rom_2_num_6,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                        child: Text(rom_2_num_6_data,
                            textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      ),
                      Text(rom_2_num_7,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                    ],
                  ),
                ),

                //ROMAWI III
                SizedBox(height: 20),
                Text(rom_3, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(rom_3_al_A, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.w600, fontSize: 13)),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 20, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(rom_3_al_A_1,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_3_al_A_2,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_3_al_A_3,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_3_al_A_4,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                    ],
                  ),
                ),
                Text(rom_3_al_B, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.w600, fontSize: 13)),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 20, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(rom_3_al_B_1,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_3_al_B_2,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_3_al_B_3,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                    ],
                  ),
                ),

                //ROMAWI IV
                SizedBox(height: 20),
                Text(rom_4, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 20, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(rom_4_num_1,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_4_num_2,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_4_num_3,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_4_num_4,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_4_num_5,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_4_num_6,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_4_num_7,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_4_num_8,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_4_num_9,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_4_num_10,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 20, bottom: 5),
                        child: Column(
                          children: [
                            Text(rom_4_num_10_data,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                          ],
                        ),
                      ),
                      Text(rom_4_num_11,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_4_num_12,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                    ],
                  ),
                ),

                //ROMAWI V
                SizedBox(height: 20),
                Text(rom_5, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 20, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(rom_5_num_1,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_5_num_2,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_5_num_3,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_5_num_4,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 20, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(rom_5_num_4_al_a,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_5_num_4_al_b,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_5_num_4_al_c,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_5_num_4_al_d,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_5_num_4_al_e,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_5_num_4_al_f,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Padding(
                              padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                              child: Text(rom_5_num_4_al_f_data,
                                  textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            ),
                            Text(rom_5_num_4_al_f_add,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Padding(
                              padding: EdgeInsets.only(top: 5, left: 20, bottom: 5),
                              child: Text(rom_5_num_4_al_f_data_2,
                                  textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            ),
                          ],
                        ),
                      ),
                      Text(rom_5_num_5,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_5_num_6,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_5_num_7,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_5_num_8,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_5_num_9,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 20, bottom: 5),
                        child: Text(rom_5_num_9_data,
                            textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      ),
                    ],
                  ),
                ),
                //ROMAWI VI
                SizedBox(height: 20),
                Text(rom_6, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 20, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(rom_6_num_1,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_6_num_2,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_6_num_3,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                        child: Text(rom_6_num_3_data,
                            textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      ),
                      Text(rom_6_num_4,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_6_num_5,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_6_num_6,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_6_num_7,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                    ],
                  ),
                ),
                //ROMAWI VII
                SizedBox(height: 20),
                Text(rom_7, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 20, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(rom_7_num_1,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_7_num_2,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_7_num_3,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_7_num_4,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(rom_7_num_4_al_a,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20),
                              child: Text(rom_7_num_4_al_a_data,
                                  textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            ),
                            Text(rom_7_num_4_al_b,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                          ],
                        ),
                      ),
                      Text(rom_7_num_5,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_7_num_6,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_7_num_7,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_7_num_8,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_7_num_9,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_7_num_10,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_7_num_11,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_7_num_12,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_7_num_13,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20),
                        child: Text(rom_7_num_13_data,
                            textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      ),
                      Text(rom_7_num_14,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_7_num_15,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                    ],
                  ),
                ),
                //ROMAWI VIII
                SizedBox(height: 20),
                Text(rom_8, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 20, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(rom_8_num_1,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_8_num_2,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_8_num_3,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_8_num_4,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_8_num_5,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_8_num_6,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_8_num_7,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_8_num_8,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_8_num_9,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                    ],
                  ),
                ),
                Text(rom_8_num_9_al_a,
                    textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.w600, fontSize: 13)),
                Text(rom_8_num_9_al_a_1,
                    textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                SizedBox(height: 10),
                Text(rom_8_num_9_al_b,
                    textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.w600, fontSize: 13)),
                Padding(
                  padding: EdgeInsets.only(bottom: 5, top: 5, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(rom_8_num_9_al_b_1,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_8_num_9_al_b_2,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_8_num_9_al_b_3,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_8_num_9_al_b_4,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_8_num_9_al_b_5,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_8_num_9_al_b_6,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_8_num_9_al_b_7,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_8_num_9_al_b_8,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_8_num_9_al_b_9,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                    ],
                  ),
                ),
                Text(rom_8_num_9_al_b_add,
                    textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),

                //ROMAWI IX
                SizedBox(height: 20),
                Text(rom_9, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(rom_9_desc, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(rom_9_num_1,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_9_num_2,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_9_num_3,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_9_num_4,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                    ],
                  ),
                ),
                //ROMAWI X
                SizedBox(height: 20),
                Text(rom_10, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(rom_10_num_1,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_10_num_2,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Text(rom_10_num_3,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                    ],
                  ),
                ),
                //ROMAWI XI
                SizedBox(height: 20),
                Text(rom_11, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(rom_11_num_1,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 5, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(rom_11_num_1_al_a,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_11_num_1_al_b,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_11_num_1_al_c,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 5, left: 20),
                              child: Text(rom_11_num_1_al_c_data,
                                  textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            ),
                          ],
                        ),
                      ),
                      //ROMAWI XII
                      SizedBox(height: 20),
                      Text(rom_12, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 5, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(rom_12_num_1,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 5, left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(rom_12_num_1_al_a,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 5, left: 20),
                                    child: Text(rom_12_num_1_al_a_data,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                                  ),
                                  Text(rom_12_num_1_al_b,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                                  Text(rom_12_num_1_al_c,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                                  Text(rom_12_num_1_al_d,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                                  Text(rom_12_num_1_al_e,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                                ],
                              ),
                            ),
                            Text(rom_12_num_2,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20),
                              child: Text(rom_12_num_2_data,
                                  textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            ),
                            Text(rom_12_num_3,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_12_num_4,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_12_num_5,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_12_num_6,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_12_num_7,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20),
                              child: Text(rom_12_num_7_data,
                                  textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            ),
                            Text(rom_12_num_8,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20),
                              child: Text(rom_12_num_8_data,
                                  textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            ),
                            Text(rom_12_num_9,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_12_num_10,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                          ],
                        ),
                      ),
                      Text(rom_12_add,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),

                      //ROMAWI XIII
                      SizedBox(height: 20),
                      Text(rom_13, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(rom_13_num_1,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20),
                              child: Text(rom_13_num_1_data,
                                  textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            ),
                            Text(rom_13_num_2,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_13_num_3,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                          ],
                        ),
                      ),
                      Text(rom_13_add,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),

                      //ROMAWI XIV
                      SizedBox(height: 20),
                      Text(rom_14, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text(rom_14_desc,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),

                      //ROMAWI XV
                      SizedBox(height: 20),
                      Text(rom_15, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text(rom_15_desc,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(rom_15_num_1,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_15_num_2,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20),
                              child: Text(rom_15_num_2_data,
                                  textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            ),
                            Text(rom_15_num_3,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_15_num_4,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_15_num_5,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_15_num_6,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_15_num_7,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_15_num_8,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20),
                              child: Text(rom_15_num_8_data,
                                  textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            ),
                            Text(rom_15_num_9,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20),
                              child: Text(rom_15_num_9_data,
                                  textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            ),
                            Text(rom_15_num_10,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_15_num_11,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                          ],
                        ),
                      ),
                      Text(rom_15_add,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                      //ROMAWI XVI
                      SizedBox(height: 20),
                      Text(rom_16, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(rom_16_num_1,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_16_num_2,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_16_num_3,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_16_num_4,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                          ],
                        ),
                      ),
                      //ROMAWI XVII
                      SizedBox(height: 20),
                      Text(rom_17, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(rom_17_num_1,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_17_num_2,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_17_num_3,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_17_num_4,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                          ],
                        ),
                      ),
                      //ROMAWI XVII
                      SizedBox(height: 20),
                      Text(rom_18, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text(rom_18_desc,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),

                      //ROMAWI XIX
                      SizedBox(height: 20),
                      Text(rom_19, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(rom_19_num_1,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_19_num_2,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_19_num_3,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_19_num_4,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_19_num_5,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                          ],
                        ),
                      ),
                      //ROMAWI XX
                      SizedBox(height: 20),
                      Text(rom_20, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(rom_20_num_1,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_20_num_2,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_20_num_3,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_20_num_4,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_20_num_5,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_20_num_6,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
                              child: Text(rom_20_num_6_data,
                                  textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            ),
                            Text(rom_20_num_7,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
                              child: Text(rom_20_num_7_data,
                                  textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            ),
                            Text(rom_20_num_8,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_20_num_9,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_20_num_10,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
                              child: Text(rom_20_num_10_data,
                                  textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            ),
                            Text(rom_20_num_10,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_20_num_12,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_20_num_13,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                          ],
                        ),
                      ),
                      //ROMAWI XXI
                      SizedBox(height: 20),
                      Text(rom_21, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(rom_21_num_1,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_21_num_2,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_21_num_3,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_21_num_4,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_21_num_5,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_21_num_6,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_21_num_7,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_21_num_8,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                            Text(rom_21_num_9,
                                textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                          ],
                        ),
                      ),
                      //ROMAWI XXII
                      SizedBox(height: 20),
                      Text(rom_22, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text(rom_22_desc,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),

                      //LAYANAN
                      SizedBox(height: 20),
                      Text(rom_23, textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Text(rom_23_data,
                          textAlign: TextAlign.left, style: TextStyle(color: brokenWhiteColor, fontWeight: FontWeight.normal, fontSize: 13)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const String tnc_title = "SYARAT DAN KETENTUAN UMUM\nXAURIUS";
const String tnc_subtitle = "(“Syarat dan Ketentuan Umum”)";
const String rom_1 = "I. UMUM";
const String rom_1_desc =
    "Xaurius (XAU) bukanlah mata uang atau alat bayar, Aset Digital Xaurius Token (”XAU”) disediakan oleh PT. Xaurius Aset Digital untuk Pengguna yang akan melakukan transaksi pembelian/penjualan XAU dengan melakukan pendaftaran akun dan/atau transaksi elektronik XAU dan poin pada platform PT. Xaurius Aset Digital secara online melalui aplikasi dan/atau website milik PT. Xaurius Aset Digital (”Transaksi Pembukaan Akun”).";
const String rom_1_num_1 =
    "1. Pembukaan Akun yang dilakukan Pengguna pada Xaurius, sepanjang tidak diatur secara khusus oleh Xaurius dan Pengguna dalam Aplikasi/website Pembukaan Akun untuk Akun yang bersangkutan, berlaku Syarat dan Ketentuan Umum ini.";
const String rom_1_num_2 =
    "2. Dengan tetap memperhatikan ketentuan pada butir 1 di atas, apabila Pengguna memiliki beberapa Akun pada satu atau beberapa Platform Xaurius, maka Akun-Akun tersebut disepakati kedua belah pihak sebagai satu kesatuan, karenanya Syarat dan Ketentuan Umum ini mengikat terhadap seluruh Akun Pengguna.";
const String rom_1_num_3 =
    "3. Nilai Rupiah pada satuan XAU ditentukan menggunakan Nilai Jual/Beli yang tercantum pada website http://www.xaurius.com atau halaman antar muka resmi milik PT. Xaurius Aset Digital dan akan diupdate setiap hari kerja pada pukul 09.30 WIB.";
const String rom_1_num_4 =
    "4. Seluruh transaksi uang atas pembelian, penjualan, dan pembelian kembali (buyback), akan dibukukan mengikuti ketentuan umum dan ketentuan mata uang masing-masing bank yang telah ditunjuk oleh dan atas nama PT. Xaurius Aset Digital yaitu:";
const String rom_1_num_4_data =
    "o Bank Central Asia (IDR/USD/SGD/RMB/HKD),\no Bank OCBC NISP (IDR/USD/SGD/RMB/HKD),\no Bank Mandiri (IDR/USD),\no Bank Rakyat Indonesia (IDR/USD),\no Bank Negara Indonesia (IDR/USD),\no Bank CIMB Niaga (IDR/USD)";
const String rom_1_num_5 =
    "5. Dalam hal Akun akan dipindahtangankan/dialihkan kepada pihak ketiga/pihak lain, harus dengan persetujuan tertulis dari PT. Xaurius Aset Digital.";
const String rom_1_num_6 =
    "6. Instruksi Pengguna kepada Xaurius dapat dilakukan melalui kantor pusat Xaurius, Customer Service Xaurius, Aplikasi Xaurius, Website Xaurius dan/ atau layanan lainnya sesuai ketentuan yang berlaku pada PT. Xaurius Aset Digital untuk masing-masing jenis layanan.";
const String rom_1_num_7 =
    "7. Pengguna tidak dapat membatalkan/mengubah instruksi yang telah dilakukan dengan alasan apapun dan transaksi tersebut mengikat Pengguna pada saat instruksi  diterima dan dilaksanakan oleh Xaurius sesuai dengan syarat dan ketentuan yang telah disepakati.";
const String rom_1_add =
    "Dalam hal Xaurius menerima lebih dari satu instruksi yang akan berdampak pada penarikan dana Akun, maka Pengguna wajib menyediakan saldo XAU yang cukup di Akunnya. Ketidaktersediaan saldo XAU dapat menyebabkan Xaurius tidak menjalankan instruksi tersebut.";

// ROMAWI II
const String rom_2 = "II. DEFINISI";
const String rom_2_desc =
    "Dalam Syarat dan Ketentuan Umum ini, kata-kata berikut akan memiliki arti sebagaimana dicantumkan di bawah ini kecuali menurut konteksnya dibutuhkan pengertian yang berbeda:";
const String rom_2_num_1 =
    "1. PT. Xaurius Aset Digital Indonesia adalah sebuah badan hukum perseroan yang berkedudukan di Jakarta, yang bertindak di seluruh Indonesia.";
const String rom_2_num_2 =
    "2. 2. Alamat E-mail adalah tanda pengenal akun pribadi milik Pengguna yang akan digunakan Pengguna untuk mengakses aplikasi dan/atau website pada platform PT. Xaurius Aset Digital dan Fasilitas/Layanan Channel Elektronik PT. Xaurius Aset Digital lainnya, yang akan disimpan dalam sistem PT. Xaurius Aset Digital yang  akan digunakan untuk tujuan pengiriman pemberitahuan maupun untuk pengiriman laporan transaksi elektronik (e-statement) oleh PT. Xaurius Aset Digital.";
const String rom_2_num_3 =
    "3. Aplikasi Xaurius dan/atau website http://www.xaurius.com adalah platform milik PT. Xaurius Aset Digital yang dapat digunakan Pembeli untuk melakukan pembukaan akun pengguna secara online. Pengguna/Pembeli dapat melakukan pendaftaran pada aplikasi/website website xaurius.com menggunakan e-KTP, alamat e-mail dan nomor telepon selular (ponsel) yang aktif.";
const String rom_2_num_4 =
    "4. Akun Pengguna adalah  suatu identitas unik yang dibuat oleh Pengguna untuk mengakses dan menggunakan layanan PT. Xaurius Aset Digital untuk Transaksi Pembelian Xaurius dan mengakses daftar transaksi/penyimpanan saldo pada layanan Platform Xaurius pada sistem Ethereum blockchain (ERC-20).";
const String rom_2_num_5 =
    "5. Fasilitas/Layanan Channel Elektronik Xaurius adalah jasa layanan informasi dan transaksi XAU yang terbatas pada Pembelian dan Penjualan yang disediakan oleh PT. Xaurius Aset Digital kepada Pengguna selama 24 (dua puluh empat) jam sehari dan 7 (tujuh) hari seminggu, serta dapat diakses secara langsung oleh Pengguna melalui ponsel menggunakan menu pada aplikasi/website dengan menggunakan media jaringan internet pada ponsel, tablet maupun komputer pribadi sesuai ketentuan yang berlaku di PT. Xaurius Aset Digital.";
const String rom_2_num_6 =
    "6. Force Majeure adalah setiap keadaan di luar kendali wajar PT. Xaurius Aset Digital dan Pengguna yang ditetapkan oleh Pemerintah dan yang di luar perkiraan dan tidak dapat diperkirakan akan terjadi yang membuat transaksi Xaurius/transaksi elektronik tidak mungkin dapat dilanjutkan atau tertunda. Kejadian tersebut adalah termasuk tetapi tidak terbatas pada:";
const String rom_2_num_6_data =
    "a. bencana alam, sambaran/serangan petir, gempa bumi, banjir, badai, ledakan, kebakaran dan bencana alam lainnya;\nb. epidemi atau pemberlakuan karantina;\nc. perang, kejahatan, terorisme, pemberontakan, huru hara, perang sipil, kerusuhan, sabotase dan revolusi;\nd. pemogokan;\ne. gangguan virus komputer atau sistem Trojan Horses atau komponen membahayakan yang dapat menggangu layanan, web browser, komputer Pengguna, atau Internet Service Provider; dan\nf. sistem atau transmisi yang tidak berfungsi, gangguan listrik, gangguan telekomunikasi, kebijakan pemerintah, kegagalan sistem perbankan.";
const String rom_2_num_7 =
    "7. Customer Service adalah unit kerja yang berwenang memberikan jasa Layanan Informasi dan Transaksi Xaurius (non tunai) yang disediakan oleh PT. Xaurius Aset Digital kepada Pengguna melalui telepon selama 24 (dua puluh empat) jam sehari dan 7 (tujuh) hari seminggu.";
const String rom_2_num_8 =
    "8. Pengaduan Pengguna adalah ungkapan ketidakpuasan Pengguna baik secara lisan atau tertulis yang disampaikan melalui sarana komunikasi atau media resmi yang telah ditentukan Xaurius yang disebabkan oleh adanya kerugian dan/atau potensi kerugian materiil, wajar dan secara langsung pada Pengguna karena tidak dipenuhinya perjanjian dan/atau dokumen transaksi keuangan yang telah disepakati.";
const String rom_2_num_9 =
    "9. Hari Kerja adalah hari Senin sampai Jumat kecuali hari libur, dimana PT. Xaurius Aset Digital dan perusahaan di Indonesia pada umumnya beroperasi dan melakukan transaksi penempatan sesuai dengan ketentuan Otoritas Pemerintah di Indonesia.";
const String rom_2_num_10 =
    "10. Xaurius “XAU” adalah komoditi aset kripto/digital Xaurius “ERC-20” dalam Ethereum Blockchain, sebagai aset digital dengan kode satuan XAU sampai satuan decimal terkecil 0,00000001 XAU yang diterbitkan oleh PT. Xaurius Aset Digital atas permohonan Pembelian oleh Pengguna yang memiliki nilai kesetaraan atas 1 (satu) XAU oleh 1 (satu) gram emas logam mulia (kadar 99.9%) (1 XAU = 1 gr emas logam mulia) sebagai fungsi tukar fisik atau nilai jual Rupiah dan/atau fungsi lainnya yang akan ditentukan oleh PT. Xaurius Aset Digital.";
const String rom_2_num_11 =
    "11. Pengguna adalah perorangan yang telah memiliki akun terdaftar di PT. Xaurius Aset Digital dan/atau menggunakan Fasilitas/Layanan Transaksi Elektronik di PT. Xaurius Aset Digital sesuai jumlah dan jenis transaksi serta persyaratan/batasan-batasan yang ditentukan oleh PT. Xaurius Aset Digital.";
const String rom_2_num_12 =
    "12. Akun adalah platform saldo Pengguna dalam bentuk aset kripto XAU Token, Poin, dan/atau bentuk lainnya yang dipersamakan dengan itu, baik yang telah dibuka Pengguna pada aplikasi/website Xaurius maupun yang akan dibuka dikemudian hari.";
const String rom_2_num_13 =
    "13. Link Verifikasi adalah link rahasia yang dikirimkan oleh sistem PT. Xaurius Aset Digital melalui surat elektronik ke e-mail Pengguna saat mendaftar pada sistem PT. Xaurius Aset Digital melalui aplikasi/website PT. Xaurius Aset Digital untuk memvalidasi proses Pendaftaran Pembukaan akun yang dilakukan oleh Pengguna.";
const String rom_2_num_14 =
    "14. Password adalah kode/sandi rahasia yang diperlukan Pengguna agar dapat mengakses dan menggunakan Aplikasi/Website PT. Xaurius Aset Digital dan Fasilitas/Layanan Channel Elektronik dan Platform Xaurius dan kewenangan penggunaannya hanya ada pada Pengguna.";
const String rom_2_num_15 =
    "15. Saldo adalah jenis-jenis satuan XAU dan/atau poin yang tersimpan pada Akun Pengguna Xaurius yang dipilih oleh Pengguna untuk dibuka secara mandiri oleh Pengguna setelah mendapat persetujuan dari PT. Xaurius Aset Digital.";
const String rom_2_num_16 =
    "16. Dompet elektronik/e-wallet adalah wadah yang dikelola oleh pihak ketiga atau pihak lainnya diluar PT. Xaurius Aset Digital yang terhubung pada sistem Ethereum blockchain (ERC-20) Xaurius milik Pengguna.";
const String rom_2_num_17 =
    "17. Perwakilan Pengguna adalah pihak yang bertindak untuk dan atas nama Pengguna dengan berdasarkan surat kuasa khusus dari Pengguna.";
const String rom_2_num_18 =
    "18. Transaksional adalah bentuk transaksi yang berdampak pada perubahan saldo XAU Akun, dan berlaku terbatas seperti transaksi pembelian XAU, transfer XAU, pemindahbukuan dompet elektronik/e-wallet, konversi fisik XAU, penjualan XAU, pembelian kembali (buyback) XAU dan transaksi-transaksi lain yang disetujui olah Xaurius.";
const String rom_2_num_19 =
    "19. Non Transaksional adalah transaksi yang tidak berdampak pada perubahan saldo Akun, seperti permintaan: inquiry saldo dan mutasi transaksi jual-beli, perubahan data, pengecekan e-wallet, Perubahan setting, dan transaksi-transaksi lain yang disetujui oleh Xaurius.";
const String rom_2_num_20 =
    "20. Masa penguncian (Lock Up) adalah kebijakan PT. Xaurius Aset Digital terhadap sebagian atau seluruh XAU “Xaurius” yang beredar untuk menerapkan periode waktu tertentu agar XAU tersebut tidak dapat di kirim/transfer, dijual Kembali kepada Xaurius, atau di Tarik (redeem) kedalam bentuk fisik Logam Mulia Emas.";
const String rom_2_num_21 =
    "21. Ultimate Beneficial Owner (UBO) adalah setiap orang perseorangan yang termasuk sebagai pihak pengendali terakhir baik secara langsung maupun tidak langsung melalui badan hukum atau berdasarkan suatu perjanjian memiliki saham perusahaan dan/atau keseluruhan struktur kelompok usaha yang mengendalikan perusahaan.";
const String rom_2_num_22 =
    "22. Definisi yang tidak diatur khusus pada aplikasi/website Xaurius ini akan berlaku definisi yang tertera pada Syarat dan Ketentuan Umum Layanan Platform Xaurius PT. Xaurius Aset Digital.";

// ROMAWI III

const String rom_3 = "III. PENDAFTARAN, PENGAKHIRAN DAN PENGHENTIAN/PERUBAHAN LAYANAN PT. XAURIUS ASET DIGITAL";
const String rom_3_al_A = "A. Pendaftaran";
const String rom_3_al_A_1 =
    "1. Untuk dapat menggunakan Layanan Platform PT. Xaurius Aset Digital Pengguna wajib terlebih dahulu mengakses melalui web browser/aplikasi versi terkini dengan minimum spesifikasi sesuai ketentuan PT. Xaurius Aset Digital.";
const String rom_3_al_A_2 = "2. Setelah Pengguna mengakses website Xaurius, Pengguna dapat memilih bahasa yang akan digunakan pada Platform Xaurius.";
const String rom_3_al_A_3 =
    "3. Untuk menggunakan Layanan PT. Xaurius Aset Digital, Pengguna diwajibkan untuk melakukan pendaftaran Akun Pengguna dengan mengklik “Daftar”/”Register” untuk memulai pendaftaran Akun Pengguna.";
const String rom_3_al_A_4 =
    "4. Hanya Pengguna perorangan berwarganegara Indonesia yang memiliki e-KTP atau berwarganegara asing yang memilik Passport, alamat e-mail dan nomor telepon selular yang aktif, yang dapat melakukan pembukaan Akun melalui aplikasi/website Xaurius.";
const String rom_3_al_B = "B. Pengakhiran dan Penghentian/Perubahan Layanan PT. Xaurius Aset Digital";
const String rom_3_al_B_1 =
    "1. Proses registrasi/pendaftaran, pengaktifan, pengakhiran dan penghentian/perubahan atas Fasilitas/Layanan Channel Elektronik/Platform Xaurius mengacu pada Syarat dan Ketentuan dari Fasilitas/Layanan Channel Elektronik Xaurius yang berlaku.";
const String rom_3_al_B_2 =
    "2. PT. Xaurius Aset Digital dapat sewaktu-waktu menghentikan dan melakukan perubahan fitur dan/atau layanan pada Platform (aplikasi/website) Xaurius (baik berupa pembatasan maupun penambahan) dan atas penghentian dan/atau perubahan tersebut akan diberitahukan terlebih dulu kepada Pengguna dengan pemberitahuan terlebih dahulu kepada Pengguna melalui media komunikasi yang tersedia pada website PT. Xaurius Aset Digital sesuai dengan ketentuan perundang-undangan yang berlaku.";
const String rom_3_al_B_3 =
    "3. Dalam hal terjadi penghentian layanan pada Platform Xaurius maka Pengguna wajib terlebih dahulu menyelesaikan seluruh kewajiban Pengguna yang masih terhutang kepada PT. Xaurius Aset Digital.";

//ROMAWI IV
const String rom_4 = "IV. KETENTUAN PENGGUNAAN PLATFORM (APLIKASI/WEBSITE) XAURIUS";
const String rom_4_num_1 =
    "1. Pengguna dengan ini menyetujui, bahwa Aplikasi/Website Xaurius hanya dapat digunakan untuk melakukan pendaftaran Akun, transaksi pembelian dan penjualan XAU, penempatan saldo XAU dan poin, penempatan ke dompet elektronik yang dikelola pihak ketiga milik Pengguna secara online yang telah ditentukan PT. Xaurius Aset Digital dan Pengguna wajib memenuhi persyaratan serta mematuhi ketentuan Pendaftaran dan Transaksi Akun untuk setiap jenis saldo/transaksi yang telah ditentukan oleh PT. Xaurius Aset Digital.";
const String rom_4_num_2 =
    "2. Dalam menggunakan layanan pada Aplikasi/Website Xaurius yang disediakan oleh PT. Xaurius Aset Digital, Pengguna wajib mengikuti petunjuk-petunjuk yang diberikan oleh PT. Xaurius Aset Digital. Setiap pemakaian paket data yang timbul pada saat melakukan akses ke aplikasi/website Xaurius menjadi tanggung jawab Pengguna sesuai dengan ketentuan masing-masing operator/penyedia layanan telpon seluler.";
const String rom_4_num_3 =
    "3. Pengguna dengan ini menyetujui bahwa setiap instruksi yang dijalankan oleh PT. Xaurius Aset Digital pada saat PT. Xaurius Aset Digital menerima instruksi tersebut dari Pengguna ditandai dengan penginputan Login Pengguna (alamat e-mail Pengguna) dan Password, tidak dapat dibatalkan/diubah dengan alasan apapun oleh Pengguna.";
const String rom_4_num_4 =
    "4. Dalam melaksanakan instruksi Pengguna, PT. Xaurius Aset Digital berhak menerapkan prosedur/persyaratan khusus seperti penerapan prosedur pengamanan untuk validasi data dan kebenaran instruksi Pengguna.";
const String rom_4_num_5 =
    "5. Dalam menggunakan Aplikasi/Website Xaurius, Pengguna wajib memastikan ketepatan dan/kelengkapan dan/atau kebenaran data dan/atau perintah/instruksi yang disampaikan Pengguna (termasuk kewajiban untuk memastikan bahwa semua data yang diperlukan untuk Pendaftaran Akun dan Transasksi dalam Platform (Aplikasi/Website) telah diisi/diberikan secara lengkap dan benar) sesuai format perintah/instruksi yang telah ditentukan oleh PT. Xaurius Aset Digital.";
const String rom_4_num_6 =
    "6. Segala Dampak yang mungkin timbul yang diakibatkan oleh kekeliruan, kesalahan, kelalaian, pemalsuan, penyalahgunaan, ketidaklengkapan, ketidakjelasan atau ketidaktepatan perintah/data dari Pengguna dan/atau akibat dengan dilaksanakannya perintah/instruksi tersebut menjadi tanggung jawab Pengguna.";
const String rom_4_num_7 =
    "7. Pengguna wajib memastikan bahwa perangkat elektronik yang digunakan untuk mengakses Platform Aplikasi/Website Xaurius dirawat secara berkala serta bebas dari virus dan/atau piranti lunak apapun yang dapat menimbukan gangguan terhadap sistem perangkat elektronik yang digunakan Pengguna maupun sistem PT. Xaurius Aset Digital.";
const String rom_4_num_8 =
    "8. Platform Aplikasi/Website Xaurius menerima dan menjalankan setiap perintah dari Pengguna sebagai perintah yang sah berdasarkan penggunaan Login e-mail dan Password Pengguna dan untuk itu PT. Xaurius Aset Digital tidak mempunyai kewajiban untuk meneliti atau menyelidiki keaslian maupun keabsahan atau kewenangan Pengguna Login e-mail dan Password atau menilai maupun membuktikan ketepatan maupun kelengkapan perintah dimaksud, dan oleh karena itu perintah tersebut sah mengikat Pengguna dengan sebagaimana mestinya.";
const String rom_4_num_9 =
    "9. Platform Aplikasi/Website Xaurius dapat diakses 24 (dua puluh empat) jam sehari dan 7 (tujuh) hari seminggu, tetapi Pengguna menyetujui bahwa pada waktu tertentu, Platform Aplikasi/Website Xaurius kemungkinan tidak dapat diakses karena dalam proses maintenance/perawatan sistem dan akan diberitahukan oleh PT. Xaurius Aset Digital melalui media komunikasi yang tersedia pada aplikasi/website/e-mail sebelum proses maintenance sistem dilakukan.";
const String rom_4_num_10 =
    "10. PT. Xaurius Aset Digital berhak menarik/membatalkan/menutup akun sesuai ketentuan yang berlaku pada Xaurius dengan pemberitahuan ke Pengguna dalam hal terjadi salah satu sebab di bawah ini:";
const String rom_4_num_10_data =
    "1. Pengguna lalai/tidak mentaati Syarat dan Ketentuan Umum ini;\n2. Pengguna meninggal dunia;\n3. Akun telah kadaluarsa; atau\n4. Sebab lainnya sesuai ketentuan perundang-undangan yang berlaku pada Xaurius.";
const String rom_4_num_11 =
    "11. Pengguna harus melakukan pengecekan terlebih dahulu terhadap kualitas jaringan masing-masing operator/penyedia layanan telpon seluler sebelum mengakses aplikasi/website Xaurius. Kegagalan Pengguna dalam mengakses aplikasi/website Xaurius yang bukan disebabkan oleh kesalahan PT. Xaurius Aset Digital diantaranya adalah kualitas jaringan masing-masing operator/penyedia layanan telpon seluler yang digunakan oleh Pengguna yang kurang baik bukan merupakan tanggung jawab PT. Xaurius Aset Digital.";
const String rom_4_num_12 =
    "12. Hak penggunaan fasilitas/layanan tanpa sepengetahuan PT. Xaurius Aset Digital, baik sebagian atau seluruhnya, untuk sementara atau selamanya kepada pihak lain menjadi tanggung jawab sepenuhnya dari Pengguna.";

//ROMAWI V
const String rom_5 = "V. KETENTUAN TRANSAKSI PEMBUKAAN AKUN";
const String rom_5_num_1 =
    "1. Hanya Pengguna perorangan berwarganegara Indonesia yang memiliki e-KTP atau berwarganegara asing yang memilik Passport, alamat e-mail dan nomor telepon selular yang aktif, yang dapat melakukan Transaksi Pembukaan Akun melalui Aplikasi/website Xaurius.";
const String rom_5_num_2 =
    "2. Transaksi Pembukaan Akun melalui Aplikasi/website Xaurius merupakan Transaksi Pembukaan Akun yang sah dan mengikat Pengguna sehingga tidak dapat dibatalkan atau diubah karena alasan apapun. Pengguna bertanggung jawab atas kebenaran serta ketepatan informasi dan data-data yang diberikan kepada PT. Xaurius Aset Digital saat melakukan Transaksi Pembukaan Akun melalui Aplikasi/website Xaurius.";
const String rom_5_num_3 =
    "3. Permintaan Transaksi Pembukaan Akun yang dikirimkan Pengguna melalui Aplikasi/website Xaurius kepada PT. Xaurius Aset Digital merupakan bukti adanya perintah dari Pengguna untuk melakukan Transaksi Pembukaan Akun.";
const String rom_5_num_4 = "4. Transaksi Pembukaan Akun melalui Aplikasi/website Xaurius akan dilakukan dengan tata cara sebagai berikut:";
const String rom_5_num_4_al_a =
    "a. Pengguna melakukan pendaftaran Transaksi Pembukaan Akun melalui Aplikasi/website Xaurius, pendaftaran melalui Xaurius hanya dapat dilakukan 1 (satu) kali untuk satu nomor e-KTP atau 1 (satu) Passport untuk orang asing, 1 (satu) nomor telepon selular dan 1 (satu) alamat e-mail.";
const String rom_5_num_4_al_b =
    "b. Pengguna yang melakukan Transaksi Pembukaan Akun melalui Aplikasi/website Xaurius dapat memilih produk XAU pada Akun yang akan dibukanya pada pembalian produk XAU memakai mata uang Rupiah Indonesia (IDR), namun dimungkinkan menggunakan Mata Uang Asing (Valuta Asing) tertentu sebagai alat transaksi pembelian Pengguna, dan terhadap proses tersebut tunduk sepenuhnya kepada peraturan dan kebijakan dari PT. Xaurius Aset Digital dan Bank(-bank) yang sah ditunjuk dan bekerja sama dengan PT. Xaurius Aset Digital.";
const String rom_5_num_4_al_c =
    "c. Pengguna wajib memilih Akun yang akan dibukanya dengan menekan tombol “Daftar” (“Register”) pada halaman muka Platform Xaurius.";
const String rom_5_num_4_al_d =
    "d. Setelah menentukan Akun yang akan dibuka, Pengguna akan diminta untuk mengisi alamat e-mail aktif Pengguna dan membuat kata sandi/Password Pengguna, Password Pengguna harus terdiri dari 8 (delapan) digit dan harus merupakan kombinasi huruf dan angka, dan selanjutnya Xaurius akan mengirimkan surat elektronik yang berisi link verifikasi ke e-mail Pengguna sesuai alamat e-mail pada form pengisian sebagai instruksi Pengguna.";
const String rom_5_num_4_al_e =
    "e. Setelah Pengguna menerima link verifikasi, Pengguna wajib menekan (klik) link verifikasi pada e-mail yang diterima Pengguna dari Xaurius atau menyalin (copy) link rujukan yang disematkan pada e-mail tersebut. Setelah melewati tahap ini, Pengguna akan diteruskan ke halaman Login Xaurius yang memberitahukan bahwa akun pengguna Pengguna telah berhasil dibuat.";
const String rom_5_num_4_al_f =
    "f. Sebelum dapat melakukan transaksi pembelian atau penjualan/menggunakan fasilitas pada platform Xaurius, Pengguna akan diminta untuk melengkapi KYC (Know Your Customer) akun Xaurius dengan mengisi:";
const String rom_5_num_4_al_f_data =
    "i. Nama Lengkap;\nii. Nomor Telepon Seluler aktif;\niii. Tanggal lahir;\niv. Alamat Tinggal;\nv. Kota Tinggal;\nvi. Kode Pos;\nvii. Negara Tinggal;";
const String rom_5_num_4_al_f_add =
    "Lalu selanjutnya dapat menekan tombol “Kirim & Lanjut”/”Submit & Next” Selanjutnya ada tahap verifikasi yang tidak terpisahkan untuk mengisi dan melengkapi:";
const String rom_5_num_4_al_f_data_2 =
    "viii. Nomor Induk Kependudukan (NIK KTP) atau Passport untuk Warga Negara Asing;\nix. Memilih File/dokumen dan Upload Foto/scan Kartu Tanda Penduduk. Pengguna wajib memastikan data pada e-KTP terbaca dengan jelas pada saat e-KTP di foto oleh Pengguna\nx. Nomor Pokok Wajib Pajak (NPWP) (jika ada);\nxi. Membuat Password baru. Password anda harus terdiri dari 8 (delapan) digit dan harus merupakan kombinasi huruf dan angka;\nxii. Memilih File/dokumen dan Upload Foto/scan Kartu Nomor Pokok wajib Pajak. Pengguna wajib memastikan data pada NPWP terbaca dengan jelas pada saat NPWP di foto oleh Pengguna (jika ada);\nxiii. Setelah seluruh data telah dimasukkan, kemudian Pengguna melanjutkan dengan menekan tombol “Kirimkan & Selesai”/”Submit & Finish”;";
const String rom_5_num_4_al_g =
    "g. Setelah Pengguna memasukkan NIK pada Aplikasi/website Xaurius, Pengguna akan diminta untuk melakukan verifikasi identitas, dengan membuat foto selfie dengan e-KTP Pengguna. Pengguna wajib memastikan Posisikan wajah Pengguna terlihat jelas.";
const String rom_5_num_4_al_h =
    "h. Pengguna wajib memastikan alamat yang ditampilkan sesuai dengan alamat terkini Pengguna. Apabila, alamat anda sekarang berbeda dengan yang ditampilkan maka Pengguna dapat mengisi “Alamat Saat Ini”.";
const String rom_5_num_4_al_i =
    "i. Untuk memverifikasi data yang telah dilengkapi oleh Pengguna, Pengguna akan diminta memastikan bahwa data yang diisi telah sesuai dan benar, kemudian Xaurius akan melakukan Verifikasi KYC sesuai data dan dokumen yang diisi oleh Pengguna untuk dapat lanjut kepada tahap berikutnya dan menggunakan seluruh fasilitas Platform Xaurius.";
const String rom_5_num_4_al_j =
    "j. Apabila Pengguna adalah badan usaha Perseroan, maka proses pendaftaran dan pembukaan akun serta verifikasi akan dilakukan di Kantor Pusat Xaurius sesuai dengan Hari Kerja PT. Xaurius Aset Digital dan apabila Pengguna memilih proses verifikasi pembukaan Akun melalui video  call, maka proses verifikasi akan  dilakukan oleh petugas PT. Xaurius Aset Digital pada hari dan waktu sesuai ketentuan yang berlaku pada PT. Xaurius Aset Digital.";
const String rom_5_num_4_al_k =
    "k. Apabila proses pendaftaran pembukaan Akun melalui Aplikasi/website Xaurius telah disetujui PT. Xaurius Aset Digital, maka Pengguna akan menerima e-mail notifikasi yang menginformasikan Akun Xaurius dan secara otomatis Pengguna akan mendapatkan Fasilitas/Layanan Channel Elektronik Xaurius  termasuk pembelian XAU Token.";
const String rom_5_num_4_al_l =
    "l. Apabila proses Transaksi Pembukaan Akun melalui Xaurius bertepatan pada hari libur dan Pengguna melakukan pembelian XAU Token pada hari libur tersebut, maka Pengguna memahami bahwa pemprosesan akan mulai efektif pada Hari Kerja PT. Xaurius Aset Digital berikutnya.";
const String rom_5_num_5 =
    "5. Pengguna wajib menekan kolom centang/checklist pada form pengisian e-mail dan password sebagai tanda persetujuan atas instruksi Transaksi Pembukaan Akun serta pada saat yang bersamaan sistem akan merekam data/informasi yang telah disetujui Pengguna dan akan tersimpan pada pusat data PT. Xaurius Aset Digital. Data/informasi tersebut merupakan data yang benar, sah dan diterima oleh PT. Xaurius Aset Digital serta merupakan bukti yang sah atas instruksi dari Pengguna kepada PT. Xaurius Aset Digital.";
const String rom_5_num_6 =
    "6. Pengguna bertanggung jawab atas kebenaran serta ketepatan informasi dan data-data yang diberikan kepada PT. Xaurius Aset Digital saat melakukan Transaksi Pembukaan Akun melalui Aplikasi/website Xaurius.";
const String rom_5_num_7 =
    "7. Setiap data/keterangan dan setiap instruksi Transaksi Pembukaan Akun melalui aplikasi/website Xaurius yang tersimpan pada data PT. Xaurius Aset Digital adalah benar dan sah, serta mengikat untuk setiap instruksi yang dilakukan Pengguna melalui aplikasi/website Xaurius. Pengguna wajib segera memberitahukan kepada PT. Xaurius Aset Digital atas setiap perubahan data/keterangan dan hal-hal lain yang berbeda dari data/ keterangan yang pernah diberikan kepada PT. Xaurius Aset Digital. Kelalaian Pengguna tidak memberitahukan perubahan tersebut kepada PT. Xaurius Aset Digital, merupakan tanggung jawab Pengguna.";
const String rom_5_num_8 =
    "8. Pengguna telah memahami setiap risiko yang mungkin timbul sehubungan dengan penggunaan Transaksi Pembukaan Akun melalui Aplikasi/website Xaurius termasuk namun tidak terbatas pada kesalahan pengisian data Pengguna, perubahan/penurunan nilai jual emas/logam mulia/XAU Token/XAURIUS Token dan proses pembukaan Akun pada hari libur dan/atau email Pengguna diretas/disalahgunakan oleh pihak ketiga dan digunakan untuk melakukan Transaksi Pembukaan Akun.";
const String rom_5_num_9 =
    "9. Pengguna dengan ini menyetujui, bahwa PT. Xaurius Aset Digital melaksanakan pembukaan Akun berdasarkan instruksi Pengguna yang disampaikan melalui Aplikasi/website Xaurius dan  PT. Xaurius Aset Digital berhak menunda, menolak, membatalkan, memblokir  dan/atau menutup Akun dan/atau layanan/fasilitas Xaurius Pengguna di PT. Xaurius Aset Digital, sekaligus membebanan biaya administrasi penutupan Akun dan biaya-biaya lain yang berlaku pada PT. Xaurius Aset Digital, antara lain jika:";
const String rom_5_num_9_data =
    "a. Pengguna memberikan data/informasi yang dianggap mencurigakan oleh PT. Xaurius Aset Digital dan/atau memberikan data/informasi palsu/tidak valid/tidak lengkap, dan/atau tidak bersedia memberikan data/informasi apapun yang diminta oleh PT. Xaurius Aset Digital sesuai dengan hukum dan perundangan yang berlaku.\nb. Profil Calon Pengguna atau Pengguna terdapat dalam Daftar Terduga Teroris dan Organisasi Teroris dan Daftar Proliferasi Senjata Pemusnah Massal.\nc. Pengguna terkena sanksi screening berdasarkan peraturan yang berlaku di Perbankan/PT. Xaurius Aset Digital dan/atau sanksi screening pada negara penerima.\nd. Terdapat permintaan tertulis dari instansi Kepolisian, Kejaksaan, Pengadilan, Pusat Pelaporan dan Analisis Transaksi Keuangan (PPATK), Kantor Pajak, atau lembaga berwenang lainnya sesuai dengan hukum dan perundangan yang berlaku atau untuk memenuhi kewajiban/utang yang belum diselesaikan oleh Pengguna kepada PT. Xaurius Aset Digital.\nterbatas pada mengakomodasi dan/atau melakukan tindak kriminal dan/atau telah atau akan terjadi penipuan yang terkait dengan Akun dan/atau layanan/fasilitas PT. Xaurius Aset Digital Pengguna termasuk yang menimbulkan kerugian bagi masyarakat dan pihak lain, dan/atau PT. Xaurius Aset Digital.\nf. Instruksi yang diberikan Pengguna bertentangan dengan peraturan PT. Xaurius Aset Digital dan atau perundang-undangan yang berlaku.\ng. Pemblokiran Akun atas permintaan instansi yang berwenang. Setiap penundaan dan/atau pembatalan akan diinformasikan melalui media komunikasi PT. Xaurius Aset Digital.";

//ROMAWI VI
const String rom_6 = "VI. PASSWORD DAN LINK VERIFIKASI";
const String rom_6_num_1 =
    "1. Link Verifikasi akan dikirimkan oleh sistem PT. Xaurius Aset Digital ke alamat e-mail Pengguna untuk ditekan/dimasukkan oleh Pengguna pada aplikasi/website Xaurius  dan diverifikasi oleh sistem PT. Xaurius Aset Digital pada saat proses Transaksi Pembukaan Akun melalui Aplikasi/website Xaurius sebagai salah satu validasi atas data alamat e-mail yang didaftarkan Pengguna pada Aplikasi/website Xaurius.";
const String rom_6_num_2 = "2. Penggunaan Password dan Link Verifikasi merupakan kewenangan Pengguna. ";
const String rom_6_num_3 = "3. Pengguna wajib mengamankan Password dan Link Verifikasi untuk kepentingannya sendiri dengan cara antara lain :";
const String rom_6_num_3_data =
    "a. Melakukan penggantian Password secara berkala.\nb. Gunakan Password dengan hati-hati agar tidak diketahui orang lain.\nc. Tidak mencatat/menyimpan Password pada telepon selular, benda-benda lainnya atau tempat-tempat yang mudah diketahui oleh orang lain.\nd. Tidak memberikan Password dan Link Verifikasi pada orang lain termasuk kepada petugas PT. Xaurius Aset Digital atau anggota keluarga/orang terdekat.\ne. Tidak menggunakan Password yang mudah ditebak seperti tanggal lahir atau identitas pribadi Pengguna.\nf. Tidak memberikan atau menolak terhadap penggunaan Password dan Link Verifikasi yang dituntun oleh orang lain atau pihak luar atau pihak PT. Xaurius Aset Digital.";
const String rom_6_num_4 =
    "4. Penggunaan Password dan Link Verifikasi pada fasilitas/layanan memiliki kekuatan hukum yang sama dengan perintah tertulis yang ditandatangani oleh Pengguna.";
const String rom_6_num_5 =
    "5. Pengguna bertanggung jawab atas seluruh instruksi transaksi kepada PT. Xaurius Aset Digital yang dilakukannya dengan menggunakan Password dan Link Verifikasi.";
const String rom_6_num_6 =
    "6. Segala perintah/ instruksi berdasarkan penggunaan Password dan Link Verifikasi oleh pihak yang tidak berwenang sepenuhnya menjadi tanggung jawab Pengguna.";
const String rom_6_num_7 =
    "7. Setiap kesalahan pengunaan Password dan Link Verifikasi oleh pihak ketiga, Pengguna dengan ini membebaskan PT. Xaurius Aset Digital dari segala tuntutan yang mungkin timbul, baik dari pihak lain maupun Pengguna sendiri sebagai akibat penyalahgunaan Password dan Link Verifikasi.";

//ROMAWI VII
const String rom_7 = "VII. PERNYATAAN DAN JAMINAN";
const String rom_7_num_1 =
    "1. Pengguna menjamin keikutsertaan Pengguna pada produk dan/atau layanan Xaurius dan/atau transaksi terkait produk/layanan bukan atas dasar persepsi bahwa Xaurius “XAU” adalah mata uang/alat bayar atau alat tukar yang bertentangan dengan peraturan perundang-undangan.";
const String rom_7_num_2 =
    "2. Pengguna menyatakan dan menyetujui bahwa instruksi yang diberikan Pengguna kepada PT. Xaurius Aset Digital untuk Transaksi Pembukaan Akun melalui Aplikasi/website Xaurius yang pelaksanaannya memerlukan/menggunakan Password, Link Verifikasi dan Tanda Persetujuan Syarat & Ketentuan (“Terms & Conditions”) diakui sebagai instruksi yang sah dan sekaligus sebagai tanda persetujuan Pengguna atas dilaksanakannya instruksi Transaksi Pembukaan Akun tersebut yang memiliki kekuatan hukum yang sama dengan perintah tertulis yang ditandatangani Pengguna dan sah mengikat sebagai bukti, kecuali Pengguna dapat membuktikan sebaliknya.";
const String rom_7_num_3 =
    "3. Pengguna dengan ini menyatakan dan menyetujui bahwa PT. Xaurius Aset Digital berhak untuk mencatat/merekam setiap instruksi Pengguna yang disampaikan melalui aplikasi/website Xaurius dan bukti instruksi dan/atau percakapan tersebut (baik dalam bentuk bukti gambar bergerak (video), foto (image), transaksi, dan/atau tape/cartridge, dan/atau salinan atas bukti-bukti tersebut) disetujui sebagai bukti yang sah dan mengikat.";
const String rom_7_num_4 =
    "4. Pengguna telah mengetahui dan memahami prosedur Transaksi Pembukaan Akun melalui Aplikasi/website Xaurius memiliki risiko yang mungkin timbul, yaitu antara lain:";
const String rom_7_num_4_al_a =
    "a. Kesalahan penggunaan layanan Xaurius yang disebabkan karena kelalaian atau kesalahan dalam memasukkan data/instruksi kepada PT. Xaurius Aset Digital yang dapat mengakibatkan antara lain:";
const String rom_7_num_4_al_a_data =
    "1) terjadinya transaksi-transaksi yang tidak dilakukan  oleh Pengguna dan dapat dibuktikan oleh Pengguna bahwa transaksi tersebut dilakukan oleh orang lain yang tidak berhak;\n2) data Pengguna dipergunakan oleh pihak lain yang tidak berhak; dan\n3) Password dan Link Verifikasi diketahui oleh orang lain termasuk keluarga.";
const String rom_7_num_4_al_b =
    "b. Terjadinya keterlambatan/kegagalan akses maupun terjadi keterlambatan/kegagalan di dalam penyediaan informasi/data dalam Transaksi Pembukaan Akun pada Aplikasi/website Xaurius dan/atau eksekusi transaksi yang instruksinya disampaikan melalui Aplikasi/website Xaurius yang antara lain disebabkan oleh: force majeure, penggunaan Aplikasi/website Xaurius yang menyimpang dari yang telah ditetapkan oleh PT. Xaurius Aset Digital berdasarkan Ketentuan Umum ini maupun sebab-sebab lain yang terjadi di luar kemampuan/kendali PT. Xaurius Aset Digital.";
const String rom_7_num_4_al_c =
    "c. Data/informasi yang disajikan PT. Xaurius Aset Digital melalui Aplikasi/website Xaurius tidak benar/menjadi rusak karena adanya gangguan dari pihak-pihak yang berusaha melakukan tindakan penyusupan untuk merusak data atau pihak ketiga lainnya yang beritikad tidak baik.";
const String rom_7_num_5 =
    "5. PT. Xaurius Aset Digital bertanggung jawab atas kelancaran operasional sistem yang dikelola oleh PT. Xaurius Aset Digital, dan Pengguna setuju bahwa kegagalan pada sistem dan/atau sarana komunikasi yang disebabkan oleh hal-hal di luar kendali PT. Xaurius Aset Digital atau gagalnya sistem karena Pengguna tidak memenuhi syarat dan ketentuan yang berlaku untuk masing-masing layanan menjadi risiko dan tanggung jawab Pengguna. Sehubungan dengan hal tersebut, Pengguna setuju dan dengan ini memberikan kuasa PT. Xaurius Aset Digital untuk melakukan koreksi atas Akun Pengguna yang terkait dengan pembukaan Akun dan/atau transaksi XAU/poin yang dilakukan Pengguna.";
const String rom_7_num_6 =
    "6. Pengguna dengan ini menyatakan bahwa PT. Xaurius Aset Digital telah memberikan penjelasan yang cukup mengenai karakteristik aplikasi/website Xaurius oleh PT. Xaurius Aset Digital yang akan digunakan Pengguna dan Pengguna telah mengerti serta memahami segala konsekuensi penggunaan Aplikasi/website Xaurius, termasuk manfaat, risiko, dan biaya-biaya yang melekat pada Aplikasi/website Xaurius yang dapat dilihat juga pada media komunikasi yang tersedia pada PT. Xaurius Aset Digital.";
const String rom_7_num_7 =
    "7. Pengguna dengan ini menyatakan bersedia menerima informasi dan/atau penawaran produk/layanan PT. Xaurius Aset Digital (termasuk produk/layanan yang dilakukan secara internal oleh PT. Xaurius Aset Digital maupun dalam rangka kerja sama dengan pihak ketiga) pada hari Senin-Sabtu di luar hari libur nasional dari jam 08.00-18.00 waktu setempat, kecuali atas permintaan Pengguna, melalui media komunikasi pribadi Pengguna (telepon, handphone, atau email) yang tercatat pada PT. Xaurius Aset Digital dan Pengguna setuju memberikan kuasa kepada PT. Xaurius Aset Digital untuk merekam atau menyimpan seluruh komunikasi tersebut dan seluruh data yang terekam atau yang dihasilkan oleh media komunikasi tersebut merupakan bukti yang sah dan mempunyai kekuatan mengikat yang sama seperti aslinya, kecuali dapat dibuktikan sebaliknya.";
const String rom_7_num_8 =
    "8. Pengguna telah membaca, mengerti, menerima dan memahami serta setuju untuk tunduk pada Ketentuan Umum Pengisian Data Pengguna melalui Aplikasi/website Xaurius dan peraturan perundang-undangan yang berlaku di negara Republik Indonesia dan kelaziman yang berlaku bagi penyelenggara sistem dan transaksi elektronik, serta ketentuan lain yang ditetapkan oleh PT. Xaurius Aset Digital Indonesia sehubungan dengan layanan transaksi pembelian/penjualan aset digital XAU melalui media elektronis termasuk aplikasi/website Xaurius.";
const String rom_7_num_9 =
    "9. Pengguna dengan ini setuju dan mengakui bahwa PT. Xaurius Aset Digital berhak untuk memperbaiki/mengubah/melengkapi ketentuan Umum ini (“Perubahan”). Untuk keperluan tersebut, PT. Xaurius Aset Digital akan memberitahukan kepada Pengguna dalam jangka waktu yang wajar atau yang ditetapkan dalam peraturan perundangan yang berlaku melalui kantor-kantor cabang PT. Xaurius Aset Digital dan/atau melalui media komunikasi lainnya sesuai data yang terakhir terdata pada PT. Xaurius Aset Digital.";
const String rom_7_num_10 =
    "10. Keikutsertaan Pengguna pada Aplikasi/website Xaurius adalah atas inisiatif Pengguna sendiri, dan tidak ada paksaan dari pihak manapun.";
const String rom_7_num_11 =
    "11. Data/informasi yang diisi oleh Pengguna pada Aplikasi/website Xaurius adalah benar dan PT. Xaurius Aset Digital berhak melakukan pemeriksaan terhadap kebenaran data/informasi yang Pengguna berikan. Semua data/informasi dan dokumen yang Pengguna berikan akan disimpan pada PT. Xaurius Aset Digital sehingga PT. Xaurius Aset Digital tidak berkewajiban untuk mengembalikannya.";
const String rom_7_num_12 =
    "12. Pengguna menyetujui untuk segera melengkapi dan menyerahkan kepada PT. Xaurius Aset Digital seluruh dokumen yang dipersyaratkan oleh peraturan perundangan yang berlaku atau yang disyaratkan oleh PT. Xaurius Aset Digital serta menerima segala konsekuensi yang timbul jika persyaratan tersebut tidak dapat dipenuhi.";
const String rom_7_num_13 =
    "13. Pengguna mengetahui dan menyetujui bahwa PT. Xaurius Aset Digital berhak melakukan pemblokiran dan/atau penutupan Akun Pengguna pada Aplikasi/website Xaurius Pengguna apabila:";
const String rom_7_num_13_data =
    "a. PT. Xaurius Aset Digital mengetahui atau memiliki cukup alasan untuk menduga bahwa telah atau akan terjadi penipuan atau kejahatan yang menyangkut Akun dan/atau layanan Xaurius Pengguna;\nb. Pengguna telah memberikan data kepada PT. Xaurius Aset Digital secara tidak benar/lengkap atau diragukan kebenarannya;\nc. Ada permintaan dari instansi Kepolisian, Kejaksaan, Pengadilan, Pusat Pelaporan dan Analisis Transaksi Keuangan (PPATK), Komisi Pemberantasan Korupsi KPK), Kantor Pajak atau instansi lain yang berwenang sesuai dengan peraturan perundang-undangan yang berlaku.";
const String rom_7_num_14 =
    '14. Pengguna telah membaca, mengerti memahami serta setuju untuk tunduk pada Syarat dan Ketentuan Umum Xaurius, Syarat dan Ketentuan Umum Akun dan Layanan PT. Xaurius Aset Digital Indonesia Tbk ("Xaurius") - ("Ketentuan Umum") atau Syarat dan Ketentuan Umum Akun dan Layanan PT. Xaurius Aset Digital Indonesia Tbk Khusus Transaksi XAU ("Ketentuan Umum Transaksi XAU") yang tunduk pada Kebijakan dan Peraturan  Badan Pengawas Perdagangaan Berjangka dan Komoditi bagi Pengguna yang menggunakan produk aset digital XAU, serta Syarat dan Ketentuan produk Xaurius yang dipilih oleh Pengguna.';
const String rom_7_num_15 =
    '15. Pengguna setuju bahwa PT. Xaurius Aset Digital dapat melakukan penawaran produk dan/atau layanan antara lain Personal Loan dan/atau layanan komoditi lainnya melalui media komunikasi pribadi Pengguna (telepon, handphone, atau email) yang tercatat pada PT. Xaurius Aset Digital dan Pengguna setuju memberikan kuasa kepada PT. Xaurius Aset Digital untuk merekam atau menyimpan seluruh komunikasi tersebut dan seluruh data yang terekam atau yang dihasilkan oleh media komunikasi tersebut merupakan bukti yang sah dan mempunyai kekuatan mengikat yang sama seperti aslinya, kecuali dapat dibuktikan sebaliknya.';

//ROMAWI VIII
const String rom_8 = "VIII. PENYETORAN, TRANSFER PEMBELIAN, PENJUALAN KEMBALI DAN REDEEM";
const String rom_8_num_1 =
    "1. Pengguna dapat melakukan pembelian XAU ke Akun secara tunai maupun non tunai dengan menggunakan setoran tunai dan/atau transfer Virtual Account atau pemindahbukuan pada Bank yang ditunjuk oleh PT. Xaurius Aset Digital termasuk namun tidak terbatas pada Bank Central Asia (IDR/USD/SGD/RMB/HKD), Bank OCBC NISP (IDR/USD/SGD/RMB/HKD), Bank Mandiri (IDR/USD), Bank Rakyat Indonesia (IDR/USD), Bank Negara Indonesia (IDR/USD), Bank CIMB Niaga (IDR/USD) dengan nilai pembelian minimal adalah Rp. 50.000,- (Lima puluh ribu rupiah). Pembelian non tunai baru dianggap berlaku efektif apabila dananya telah diterima oleh Xaurius dan sesuai dengan ketentuan pembukuan yang diatur pada butir IX (Pembukuan) pada Syarat dan Ketentuan Umum ini. Setoran melalui counter Bank hanya diakui apabila dana telah masuk dan dokumen transaksi telah divalidasi (bukti cetakan data dari sistem) atau disahkan oleh petugas Bank sesuai dengan ketentuan/prosedur yang berlaku pada Bank.";
const String rom_8_num_2 =
    "2. Penyetoran untuk pembelian XAU yang berkaitan dengan Akun dalam valuta asing (valas) akan mengikuti kurs/biaya administrasi sesuai Ketentuan Tarif pada saat transaksi dibukukan oleh Bank. Apabila karena suatu hal Pengguna tidak dapat melakukan pembayaran sesuai jenis mata uang dari Akun Pengguna, maka terkait transaksi Pengguna diberikan pilihan: (a) melakukan pembayaran melalui transfer di Bank lainnya; atau (b) melakukan konversi atas transaksi yang dilakukan ke dalam mata uang Rupiah sesuai Ketentuan Tarif pada saat transaksi dilakukan. Biaya yang timbul terkait pilihan tersebut (biaya transfer/biaya lainnya serta biaya administrasi) disetujui Pengguna untuk dibebankan kepada Pengguna sesuai Ketentuan Tarif yang berlaku pada Bank dan PT. Xaurius Aset Digital.";
const String rom_8_num_3 =
    "3. Apabila terdapat tolakan/retur atas setoran pambayaran oleh Bank, maka Pengguna dengan ini setuju dan membebaskan Xaurius dari kewajiban atas pembelian XAU kepada Akun Pengguna dan Pengguna wajib melakukan konfirmasi secara mandiri atas setoran pembayaran tersebut kepada Bank terkait.";
const String rom_8_num_4 =
    "4. Apabila transaksi pembelian dan pembelian kembali (buyback) XAU dilakukan dalam valuta yang berbeda, maka Xaurius dengan ini diberi kuasa oleh Pengguna untuk melakukan konversi atas nilai XAU pada Rupiah pada hari transaksi sesuai ketentuan/prosedur yang berlaku pada Bank. Pengguna juga setuju bahwa pelaksanaan transaksi yang terkait dengan valas tunduk pada peraturan perundang-undangan yang berlaku serta Pengguna bersedia memenuhi persyaratan yang ditentukan oleh Bank.";
const String rom_8_num_5 =
    "5. Pengguna setuju dan dengan ini memberi kuasa kepada Xaurius untuk melakukan konversi atas transaksi setoran/incoming transfer untuk pembelian/pembelian kembali (buyback) XAU yang melibatkan valuta yang berbeda dengan Bank tujuan sesuai dengan Ketentuan Tarif yang berlaku yang dapat dilihat melalui media komunikasi yang tersedia pada Bank tersebut.";
const String rom_8_num_6 =
    "6. Pengguna setuju dan dengan ini memberi kuasa kepada Xaurius untuk melakukan konversi dan pembebanan biaya-biaya kepada Pengguna atas transaksi konversi XAU menjadi logam mulia emas fisik dan/atau pembelian kembali (Buyback) XAU/logam mulia XAU yang melibatkan biaya gas Ethereum, biaya layanan, biaya lainnya, dan pajak-pajak sesuai dengan Ketentuan Tarif yang berlaku di Indonesia.";
const String rom_8_num_7 =
    "7. Pengguna setuju dan dengan ini memberi hak kepada Xaurius untuk melakukan kebijakan Masa Tunggu untuk penarikan (redeem) Fisik Logam Mulia Emas dan/atau masa penguncian (Lock Up) untuk transaksi penjualan Kembali dan/atau transfer kirim kepada Xaurius dan/atau pengguna lain dalam periode tertentu yang akan diinformasikan kepada Pengguna melalui media komunikasi Xaurius (website, e-mail, Customer Service)";
const String rom_8_num_8 =
    "8. Pengguna tidak diperkenankan melakukan penarikan Logam Mulia Emas, penjualan Kembali, dan transfer kirim XAU dari Akun Xaurius pada periode masa tunggu/masa penguncian (Lock Up) dan/atau Pengguna melakukan penarikan XAU/Logam Mulia Emas melampaui jumlah saldo XAU yang mengakibatkan saldo Akun Pengguna menjadi debet (overdraft/cerukan). Jika pengguna lalai atau menyalahgunakan layanan XAU pada masa penguncian (Lock Up) dan pada masa tunggu, maka seluruh akibat hukum dan kerugian tersebut menjadi tanggung jawab Pengguna dan membebaskan Xaurius dari tuntutan apapun.";
const String rom_8_num_9 =
    "9. Xaurius hanya berkewajiban untuk melayani transaksi terbatas pada redeem Logam Mulia Emas/pembelian XAU/penjualan XAU/pemindahbukuan XAU/transfer XAU dari Akun dompet elektronik/e-wallet Pengguna sesuai instruksi/permintaan dari Pengguna atau Perwakilan Pengguna atau dari Pihak lain yang telah bekerjasama dengan PT.Xaurius Aset Digital dan dengan memperhatikan otorisasi instruksi Pengguna melalui Platform Aplikasi/Website yang telah diadministrasikan di Xaurius dengan ketentuan sebagai berikut:";
const String rom_8_num_9_al_a = "A. Khusus XAU:";
const String rom_8_num_9_al_a_1 =
    "Perintah pembelian XAU atau perintah penjualan atau pembelian kembali (buyback) XAU dari Akun Xaurius dapat dilakukan Pengguna melalui aplikasi/website dengan menggunakan menu transaksi yang disediakan oleh Xaurius dengan tetap memperhatikan ketentuan verifikasi Pengguna melalui otorisasi akun dan password yang diadministrasikan pada Platform Xaurius dan Harga yang berlaku atas XAU berdasarkan harga yang tercantum pada media/platform Xaurius pada waktu transaksi. Selain itu transaksi dapat juga menggunakan layanan pihak ketiga lainnya, pihak ketiga dimaksud adalah pedagang aset kripto yang terdaftar di Bappebti yang disediakan dan disetujui oleh Xaurius dengan mengalihkan tanggung jawab, dan pemenuhan syarat dan ketentuan tersendiri yang melekat pada Pihak Ketiga tersebut.";
const String rom_8_num_9_al_b = "B. Khusus Logam Mulia Emas Fisik:";
const String rom_8_num_9_al_b_1 =
    "1. Redeem Logam Mulia Emas Fisik dari XAU  dapat dilakukan Pengguna dengan menggunakan dan menandatangani Form Redeem Logam Mulia Emas atau sarana redeem yang disediakan oleh Xaurius, melalui Kantor Pusat Xaurius atau layanan lainnya yang disediakan dan disetujui oleh Xaurius dengan mengikuti ketentuan yang berlaku pada PT. Xaurius Aset Digital, sedangkan untuk pembelian dan/atau penjualan dari Akun Xaurius yang dilakukan oleh Pengguna, cukup dengan menggunakan media aplikasi/website dengan tetap memperhatikan ketentuan verifikasi Pengguna melalui Akun dan Password dan/atau verifikasi lain yang telah diadministrasikan pada Xaurius.";
const String rom_8_num_9_al_b_2 =
    "2. Redeem Logam Mulia Emas Fisik dari XAU dapat dilakukan dalam bobot/nilai minimal 5 (lima) gram atau bobot/nilai gramasi lainnya (sesuai dengan ketersediaan atau ketentuan produk terkait), dengan menggunakan dokumen transaksi sesuai ketentuan yang berlaku pada Xaurius dan ketentuan verifikasi Pengguna melalui Akun dan Password dan/atau verifikasi lainnya yang telah diadministrasikan pada Xaurius.";
const String rom_8_num_9_al_b_3 =
    "3. Dalam hal Redeem Logam Mulia Emas Fisik dari XAU yang dikuasakan (termasuk penanda-tanganan resi), Pengguna telah mengerti dan bersedia menanggung atas risiko yang timbul akibat pemberian kuasa  tersebut.";
const String rom_8_num_9_al_b_4 =
    "4. Pengguna bersedia mematuhi ketentuan-ketentuan yang mengatur penandatanganan Form Redeem Logam Mulia Emas Fisik dari XAU, pelunasan bea meterai dan ketentuan lain yang mengatur penarikan, termasuk adanya kewajiban untuk mengisi data diri Pengguna atau sarana penarikan lainnya yang ditentukan oleh Xaurius dengan lengkap dan benar sesuai dengan peraturan yang berlaku serta menatausahakan/menyimpan buku/lembaran Form Redeem  atau sarana redeem/data akun Xaurius lainnya tersebut dengan baik. Segala risiko dan kerugian yang timbul atas kelalaian Pengguna dan/atau Perwakilan Pengguna didalam pengisian/penyimpanan atau sarana penarikan/ata akun transaksi lainnya tersebut yang menyebabkan Logam Mulia Emas Fisik dari XAU atau sarana penarikan/data akun Xaurius lainnya tersebut hilang dan/atau disalahgunakan oleh orang-orang/pihak yang tidak berhak sepenuhnya menjadi tanggung jawab Pengguna. Kecuali yang disebabkan oleh kelalaian/kesalahan PT. Xaurius Aset Digital.";
const String rom_8_num_9_al_b_5 =
    "5. Permintaan Form Redeem Logam Mulia Emas Fisik dari XAU harus dilakukan secara tertulis oleh Pengguna dan pengembalian tanda terima Logam Mulia Emas Fisik harus dilakukan pada saat penerimaan Logam Mulia Emas oleh Pengguna atau Perwakilan Pengguna. Pengguna dengan ini setuju bahwa Xaurius akan langsung melakukan Pendebetan saldo XAU atas Logam Mulia Emas yang telah diambil oleh Pengguna atau Perwakilan Pengguna tersebut sesuai prosedur yang berlaku pada Xaurius. Selain itu permintaan Penarikan Logam Mulia Emas Fisik dari XAU dapat dilakukan melalui layanan lainnya yang disediakan oleh Xaurius, seperti melalui Customer Service Xaurius.";
const String rom_8_num_9_al_b_6 =
    "6. Pengguna wajib menyediakan saldo XAU yang cukup pada Akun paling kurang sebesar nilai nominal Redeem Logam Mulia Emas Fisik dari XAU dan Pengguna tidak diperkenankan melakukan Redeem Logam Mulia Emas Fisik dari XAU saat saldo kosong/tidak mencukupi dengan alasan apapun.";
const String rom_8_num_9_al_b_7 =
    "7. Redeem Logam Mulia Emas Fisik dari XAU yang diproses oleh Xaurius yang menerima Instruksi redeem atau penarikan dari pemilik Akun dan tidak diambil oleh Pengguna selama 1 (satu) bulan sejak tanggal penarikan atau jangka waktu yang disepakati, Pengguna setuju dan dengan ini memberi kuasa kepada Xaurius untuk menyimpan dan membebankan kepada Pengguna biaya penyimpanan atas Logam Mulia Emas tersebut terhitung dari tanggal penarikan Logam Mulia Emas tersebut.";
const String rom_8_num_9_al_b_8 =
    "8. Khusus untuk Pengguna yang berbentuk badan usaha atau badan hukum, dapat mengajukan permohonan kepada Xaurius untuk penggunaan stempel/cap sebagai satu persyaratan dalam redeem/penarikan/Instruksi tertulis lainnya berkaitan dengan Akun Xaurius Pengguna. Pengguna setuju bahwa ukuran, warna tinta stempel/cap maupun warna tinta tanda tangan tidak akan dijadikan sebagai alat verifikasi oleh Xaurius.";
const String rom_8_num_9_al_b_9 =
    "9. Akun Xaurius yang tidak aktif sesuai ketentuan PT. Xaurius Aset Digital dalam periode tertentu akan diperlakukan sebagai Akun Pasif/Dormant. Pengaktifan Akun Pasif dilakukan sesuai dengan prosedur yang berlaku pada Xaurius. Pencetakan Bukti Mutasi Akun Pasif/Dormant mengacu pada  point II.C.1.a. Namun jika tidak mempunyai saldo XAU atau pun saldo lain maka Pengguna memberikan kuasa dan setuju kepada aturan PT. Xaurius Aset Digital untuk menghapus secara permanen akun tersebut dan memberitahukan kepada Pengguna melalui surat elektronik atau media Telepon/Handphone kepada Pengguna.";
const String rom_8_num_9_al_b_add =
    "Pengguna dengan ini setuju bahwa PT. Xaurius Aset Digital berwenang untuk tidak menjalankan transaksi XAU atau menunda pelaksanaan transaksi jika transaksi Pengguna terkait dengan adanya larangan/pembatasan/persyaratan yang harus dipenuhi terlebih dahulu sebagaimana telah diatur dalam peraturan perundang-undangan yang berlaku dan/atau kebijakan internal Xaurius dan atas hal tersebut akan diberitahukan oleh PT. Xaurius Aset Digital kepada Pengguna.";

//ROMAWI IX
const String rom_9 = "IX. Pembukuan";
const String rom_9_desc = "Pembukuan atas Akun dilakukan oleh Xaurius dengan ketentuan sebagai berikut:";
const String rom_9_num_1 =
    "1. Setiap transaksi XAU, baik pembelian XAU, penjualan XAU maupun redeem Logam Mulia Emas pada Akun yang mengakibatkan perubahan saldo/mutasi XAU, akan dibukukan/dicatat pada suatu media yang ditetapkan oleh PT. Xaurius Aset Digital (”Bukti Mutasi”). Namun jika dalam hal terdapat perbedaan saldo/mutasi antara yang tercatat pada Bukti Mutasi yang dikuasai Pengguna dengan catatan/pembukuan yang terdapat pada PT. Xaurius Aset Digital, maka saldo/mutasi yang tercatat pada pembukuan PT. Xaurius Aset Digital merupakan bukti yang sah dan mengikat Pengguna, kecuali dapat dibuktikan sebaliknya.";
const String rom_9_num_2 =
    "2. Pencetakan dan pengiriman Bukti Mutasi dilakukan melalui media sesuai perjanjian dengan Pengguna dengan tetap memperhatikan ketentuan yang berlaku pada Xaurius. ";
const String rom_9_num_3 =
    "3. Dalam hal Bukti Mutasi (yang berbentuk statement/laporan konsolidasi) yang dikirim ke alamat Pengguna dikembalikan ke Xaurius dalam waktu 2 (dua) bulan (atau dalam periode tertentu yang ditentukan Xaurius dan akan diinformasikan kepada Pengguna), sejak tanggal diterbitkan oleh Xaurius, maka Xaurius berhak dan dengan ini diberikan wewenang oleh Pengguna untuk menghancurkan Bukti Mutasi tersebut dan tidak melakukan pencetakan terhadap statement hingga Pengguna memberitahukan kepada Xaurius untuk melakukan pencetakan kembali atas dokumen tersebut.";
const String rom_9_num_4 = "4. Pengguna dapat mengajukan permintaan mutasi transaksi di Kantor Pusat Xaurius sesuai ketentuan yang berlaku.";

//ROMAWI X
const String rom_10 = "X. DISKON DAN POIN";
const String rom_10_num_1 =
    "1. Potongan dan diskon harga atas pembelian XAU adalah kebijakan sepihak dari PT. Xaurius Aset Digital yang diberikan kepada Pengguna atau Pihak Pembeli yang ditentukan berdasarkan kebijakan umum yang akan disediakan pada media informasi dan/atau platform Xaurius atau atas suatu kesepakatan dengan perjanjian kepada pihak lain terhadap prestasi jumlah pembelian yang dilakukan Pengguna atau Pihak lain.";
const String rom_10_num_2 =
    "2. Poin adalah kebijakan sepihak dari PT. Xaurius Aset Digital yang diberikan kepada Pengguna atau Pihak lain yang menggunakan platform xaurius atas suatu prestasi yang dicapai dan sesuai dengan ketentuan Xaurius dan ketentuan umum ini yang akan ditempatkan pada platform Xaurius dan dapat digunakan untuk melakukan pembelian XAU pada platform Xaurius sesuai nilai yang cukup dan ditentukan oleh PT. Xaurius Aset Digital mengikuti syarat dan ketentuan dari PT. Xaurius Aset Digital.";
const String rom_10_num_3 =
    "3. Pengguna dan Pihak lain mengetahui dan setuju bahwa kebijakan terhadap penentuan diskon dan poin maupun ketentuan penggunaan poin adalah kewenangan sepihak PT. Xaurius Aset Digital dan tidak dapat diganggu gugat oleh pihak lain.";

//ROMAWI XI
const String rom_11 = "XI. PANJAMINAN SALDO XAU";
const String rom_11_num_1 = "1. Penjaminan Saldo XAU:";
const String rom_11_num_1_al_a =
    "a. Pengguna mengakui bahwa PT. Xaurius Aset Digital mempunyai hak terlebih dahulu untuk melakukan pembelian kembali (buyback) atas Aset Kripto XAU Pengguna yang menyatakan diri ingin menjual Aset Kripto XAU dengan harga dan nilai yang akan diinformasikan pada media platform Xaurius atau informasi pada Customer Service Xaurius. ";
const String rom_11_num_1_al_b =
    "b. Pengguna mengakui telah mengetahui bahwa terhadap saldo XAU Pengguna pada PT. Xaurius Aset Digital atau atau pada Dompet elektronik/e-wallet Perusahaan perdagangan aset kripto lain berlaku peraturan terkait Badan Pengawas Perdagangan Berjangka dan Komoditi Republik Indonesia adalah sesuai yang ditentukan dalam peraturan perundang-undangan yang berlaku.";
const String rom_11_num_1_al_c =
    "c. Pengguna dengan ini mengetahui dan menyatakan menerima risiko dan segala kerugian atas saldo XAU “Xaurius” yang akan dikecualikan dari ketentuan penjaminan oleh PT. Xaurius Aset Digital jika:";
const String rom_11_num_1_al_c_data =
    "1) Data saldo XAU Pengguna tidak tercatat pada PT. Xaurius Aset Digital.\n2) Data Saldo XAU yang tercatat pada akun pihak ketiga lainnya.\n3) Melakukan transaksi penjualan XAU kepada pihak lain dengan tidak mengindahkan ketentuan hak pembelian kembali (buyback) kepada PT. Xaurius Aset Digital.\n4) Termasuk kategori Pengguna yang diuntungkan secara tidak wajar (yaitu pencucian aset atau harta hasil tindak pidana atau penghindaran pajak “tax avoidance”), termasuk menerima risiko atas saldo XAU sebagai saldo yang tidak layak dibayar jika ijin usaha PT. Xaurius Aset Digital dicabut.\n5) Menyebabkan kondisi PT. Xaurius Aset Digital tidak sehat.";

//ROMAWI XII
const String rom_12 = "XII. PENGHENTIAN SEMENTARA ATAS TRANSAKSI PEMBLOKIRAN DAN PENUTUPAN AKUN DAN/ ATAU LAYANAN XAURIUS";
const String rom_12_num_1 =
    "1. Pengguna dengan ini mengetahui dan menyetujui bahwa PT. Xaurius Aset Digital berhak dan berwenang untuk menolak menjalankan instruksi Pengguna dan/atau menghentikan sementara transaksi XAU Pengguna dan/atau memblokir sementara Akun dan/atau layanan yang diperoleh Pengguna dari Layanan Platform Xaurius, yang disebabkan oleh sebab-sebab tertentu, termasuk namun tidak terbatas pada:";
const String rom_12_num_1_al_a = "a. Pertimbangan Xaurius, antara lain:";
const String rom_12_num_1_al_a_data =
    "1) Adanya keragu-raguan dalam melakukan verifikasi terhadap identitas/instruksi Pengguna; atau\n2) Xaurius tidak dapat melakukan verifikasi terhadap identitas Pengguna; atau\n3) Terdapat pertentangan diantara instruksi yang diberikan Pengguna kepada Xaurius dan/atau terdapat sengketa diantara Pengguna; atau\n4) Saldo pada Akun Pengguna tidak mencukupi dan/atau Akun dalam keadaan tidak aktif (diblokir, Akun Pengguna masuk dalam kriteria Akun Pasif dan lainnya); maupun\n5) Penggunaan Akun tidak sesuai dengan profil Pengguna dan terdapat indikasi pelanggaran tindak pidana pencucian uang dan/atau pendanaan terorisme.";
const String rom_12_num_1_al_b = "b. Permintaan dari instansi terkait atau Lembaga Bank sebagaimana diatur dalam regulasi yang berlaku.";
const String rom_12_num_1_al_c = "c. Diwajibkan oleh peraturan perundang-undangan yang berlaku.";
const String rom_12_num_1_al_d =
    "d. Karena sebab-sebab lain yang terjadi diluar kendali PT. Xaurius Aset Digital (termasuk namun tidak terbatas pada terjadinya force majeure) atau bertentangan dengan ketentuan yang ditetapkan.";
const String rom_12_num_1_al_e =
    "e. Khusus untuk sengketa/permasalahan diantara Pengguna dan/atau adanya pertentangan instruksi, maka Pengguna dengan ini setuju bahwa PT. Xaurius Aset Digital akan menjalankan instruksi setelah ada kejelasan atas sengketa/permasalahan tersebut dan menerima klarifikasi resmi dari para pihak yang bersengketa yang dibuktikan dengan akta perdamaian/dokumen lain yang dipersyaratkan/dapat diterima oleh PT. Xaurius Aset Digital.";
const String rom_12_num_2 =
    "2. Pengguna dengan ini mengetahui dan menyetujui bahwa PT. Xaurius Aset Digital berhak melakukan pemblokiran dan/atau penutupan atas Akun dan/atau layanan Xaurius Pengguna apabila:";
const String rom_12_num_2_data =
    "a. PT. Xaurius Aset Digital mengetahui atau memiliki cukup alasan untuk menduga bahwa telah atau akan terjadi penipuan atau kejahatan perbankan yang menyangkut Akun dan/atau layanan Xaurius Pengguna.\nb. Pengguna telah memberikan data kepada Xaurius secara tidak benar/lengkap atau diragukan kebenarannya.\nc. Ada permintaan dari instansi Kepolisian, Kejaksaan, Pengadilan, Pusat Pelaporan dan Analisis Transaksi Keuangan (PPATK), Komisi Pemberantasan Korupsi (KPK), Kantor Pajak atau instansi lain yang berwenang sesuai dengan peraturan perundang-undangan yang berlaku.";
const String rom_12_num_3 =
    "3. Pengguna dengan ini setuju dan memberi kuasa kepada PT. Xaurius Aset Digital untuk melakukan pendebetan XAU/poin dari Akun apabila diketahui bahwa Akun Pengguna diindikasikan terkait penipuan dan/atau kejahatan sesuai ketentuan yang berlaku.";
const String rom_12_num_4 =
    "4. Penutupan Akun dapat dilakukan oleh Pengguna atau Perwakilan Pengguna melalui Customer Service pada kantor pusat Pemelihara Akun sesuai ketentuan produk yang berlaku.";
const String rom_12_num_5 =
    "5. Pengguna wajib memberitahukan secara tertulis kepada kantor pusat pemelihara Akun pada hari dan jam kerja yang berlaku pada umumnya, apabila Pengguna memutuskan untuk menutup/membatalkan penggunaan Akun dengan alasan apapun.";
const String rom_12_num_6 =
    "6. Jika Akun Xaurius yang digunakan untuk layanan Penarikan Logam Mulia Emas Fisik akan ditutup, maka sebelum Akun ditutup Pengguna harus mengalihkan ke Akun lainnya untuk layanan XAU atau jika bobot/nilai minimum Penarikan Logam Mulia Emas Fisik belum terpenuhi, Pengguna wajib membayar kekurangan nilai/bobot untuk memenuhi bobot/nilai minimal Penarikan Logam Mulia Emas Fisik.";
const String rom_12_num_7 =
    "7. Jika Pengguna menutup Akun atas permintaan sendiri atau karena suatu hal tertentu ditutup oleh Xaurius, maka seluruh transaksi dan kewajiban Pengguna yang belum diselesaikan harus dipenuhi dengan tetap mengacu pada ketentuan Xaurius, yaitu:";
const String rom_12_num_7_data =
    "1) Pengguna wajib membawa Bukti Mutasi yang disyaratkan.\n2) Pencairan/Penarikan XAU dilakukan berdasarkan instruksi Pengguna dengan menggunakan media, memenuhi nilai/bobot minimal dan prosedur yang berlaku pada Xaurius.\n3) Pencairan/Penarikan XAU dapat diakukan ke dalam konversi Logam Mulia Emas Fisik dengan memenuhi kriteria nilai/bobot minimal dan prosedur yang berlaku pada Xaurius.\n4) Apabila  pencairan saldo XAU akan dikredit/ditransfer ke Akun Pengguna/pihak lain yang terdapat pada Dompet Elektronik atau e-wallet lain (sesuai instruksi Pengguna pada saat awal penempatan), Pengguna setuju dan mengakui sepenuhnya bahwa Akun XAU yang masih dikuasai Pengguna demi hukum menjadi tidak berlaku dan tidak dapat ditagih/dimintakan kembali pembayarannya kepada Xaurius. Bukti pelaksanaan pembukuan/transfer ke Akun Pengguna/pihak lain berdasarkan instruksi tersebut merupakan bukti pencairan dan penerimaan XAU yang sah serta mengikat Pengguna dan penerima XAU.\n5) Pencairan saldo XAU dalam bentuk Emas Fisik/ Nilai Rupiah yang ditransfer ke pihak lain pelaksanaan transfernya dapat dilakukan pada hari kerja yang bersangkutan sepanjang pada hari kerja dan kegiatan operasional dalam kondisi normal. Namun jika tanggal tersebut jatuh pada hari libur nasional/yang ditetapkan oleh Bank Indonesia/Pemerintah, maka transfer dimaksud  akan dilakukan Xaurius pada hari kerja berikutnya.\n6) Biaya yang timbul sehubungan dengan pelaksanaan pencairan/penarikan XAU dan transfer tersebut, akan dibebankan  kepada Pegguna, dikurangi dari nominal “dalam Rupiah” dari hasil pencairan/penarikan XAU. Pelaksanaan transfer akan  dilakukan oleh Xaurius sesuai dengan data instruksi  yang diberikan secara tertulis dari Pengguna. Hal-hal yang berkaitan dengan pelaksanaan transfer tersebut, tunduk pada Ketentuan Umum Transfer Dalam/Luar Negeri pada Xaurius.";
const String rom_12_num_8 =
    "8. PT. Xaurius Aset Digital berhak melakukan penutupan Akun Pengguna (termasuk layanan Aplikasi/Website, Layanan Pencairan/Penarikan XAU, atau layanan lainnya yang diperoleh Pengguna berkaitan dengan Akun) dan sekaligus membebankan biaya administrasi penutupan Akun dan biaya lain yang berlaku kepada Pengguna:";
const String rom_12_num_8_data =
    "a.	Jika Akun Pengguna termasuk kriteria Akun Pasif/Dormant dan saldo telah menjadi nol.\nb.	Apabila Pengguna memberikan data yang diragukan kebenarannya oleh pihak Xaurius.\nc.	Jika penggunaan Akun tidak sesuai dengan profil Pengguna. \nd.	Berdasarkan peraturan perundang-undangan yang berlaku PT. Xaurius Aset Digital menjadi diwajibkan untuk menutup Akun Pengguna.";
const String rom_12_num_9 =
    "9. Penutupan tersebut dilakukan dengan pemberitahuan kepada Pengguna melalui sarana yang lazim digunakan kecuali untuk penutupan Akun Pengguna yang termasuk kriteria Akun Pasif/Dormant dan saldo telah menjadi nol, Pengguna menyetujui dan memberikan kuasa kepada PT. Xaurius Aset Digital untuk melakukan penutupan Akun tersebut secara otomatis oleh sistem Xaurius.";
const String rom_12_num_10 =
    "10. Apabila Pengguna meninggal dunia atau pailit atau dibubarkan atau diletakkan dibawah pengawasan pihak yang ditunjuk oleh instansi yang berwenang, maka PT. Xaurius Aset Digital berhak memblokir Akun dan hanya akan mengalihkan hak atas Akun kepada ahli waris atau pengganti haknya yang sah atau pihak yang ditunjuk sesuai peraturan perundang-undangan yang berlaku dan dengan memenuhi persyaratan yang ditentukan oleh Xaurius.";
const String rom_12_add =
    "Pengguna dengan ini setuju membebaskan PT. Xaurius Aset Digital dari semua tanggung jawab dan klaim yang timbul terkait penyerahan kepada ahli waris atau pengganti haknya atau pihak yang ditunjuk instansi yang berwenang tersebut pada butir 10 di atas.";

//ROMAWI XIII
const String rom_13 = "XIII. PRODUK PIHAK KETIGA";
const String rom_13_num_1 =
    "1. Dalam hal Pengguna memilih XAU dari pihak ketiga dimana Xaurius hanya bertindak sebagai pihak yang memasarkan produk/layanan kepada pihak ketiga tersebut, Pengguna dengan ini setuju bahwa:";
const String rom_13_num_1_data =
    "a. PT. Xaurius Aset Digital tidak memberikan jaminan/menanggung transaksi XAU yang dilakukan Pengguna, baik nilai pokok maupun hasil pengembangannya (jika produk/layanan tersebut memberikan perlindungan atau jaminan atas nilai pokok dan hasil pengembangannya);\nb. Pengguna berkewajiban untuk melakukan pengecekan Kinerja setiap produk XAU dari pihak ketiga serta kinerja dari penyedia produk atau layanan tersebut.";
const String rom_13_num_2 =
    "2. Hal-hal terkait dengan produk XAU “Xaurius” dari pihak ketiga diatur dalam Syarat dan Ketentuan Umum Pihak Ketiga yang dibuat terpisah namun jika tidak diatur spesifik oleh Pihak Ketiga terhadap Produk Layanan Xaurius/XAU maka dapat merujuk dari Syarat dan Ketentuan Umum ini.";
const String rom_13_num_3 =
    "3. Informasi terkait produk XAU “Xaurius” dari pihak ketiga yang diberikan PT. Xaurius Aset Digital kepada Pengguna merupakan informasi yang diterima Xaurius dari pihak ketiga sebagai bahan referensi dan tidak dimaksudkan untuk tujuan lain.";
const String rom_13_add =
    "Pengguna dengan ini setuju bahwa PT. Xaurius Aset Digital bukan merupakan penasehat investasi bagi Pengguna dan PT. Xaurius Aset Digital tidak memiliki kewajiban untuk memeriksa atau melakukan verifikasi atas setiap informasi  yang diberikan kepada Pengguna tersebut. Pengguna dengan ini juga menyatakan menjamin dan membebaskan PT. Xaurius Aset Digital dari segala risiko yang timbul dari Pihak Ketiga akibat tidak dapat dilakukannya atau adanya keterlambatan pengiriman informasi kepada Pengguna atau atas setiap kesalahan dalam informasi yang diterima Pengguna.";

//ROMAWI XIV
const String rom_14 = "XIV. BIAYA (-BIAYA) DAN DENDA PT. XAURIUS ASET DIGITAL";
const String rom_14_desc =
    "Pengguna dikenakan biaya sehubungan dengan layanan yang digunakan Pengguna termasuk namun tidak terbatas pada biaya layanan (gas ethereum), biaya pengiriman, pajak-pajak yang harus dibebankan kepada Pengguna, maupun biaya-biaya lainnya yang berlaku pada PT. Xaurius Aset Digital sehubungan dengan aplikasi/website PT. Xaurius Aset Digital yang nilainya akan diberitahukan kepada Pengguna dan meminta persetujuan dari Pengguna sebelum PT. Xaurius Aset Digital melakukan sebuah instruksi yang membebankan biaya kepada Pengguna. Pembebanan biaya-biaya tersebut dilakukan sesuai ketentuan PT. Xaurius Aset Digital.\nPT. Xaurius Aset Digital berhak dan dengan ini diberi kuasa oleh Pengguna untuk membebankan dan mendebet Akun Pengguna guna pembayaran biaya (biaya administrasi, bea meterai, biaya sehubungan dengan fasilitas-fasilitas yang dikehendaki Pengguna, biaya teleks, biaya faksimili, provisi, maupun biaya penutupan Akun) dan biaya lainnya yang berlaku pada Xaurius.\nPengguna hanya dikenakan denda atas suatu sanksi yang mungkin timbul atau telah timbul akibat perbuatan Pengguna yang lalai dan/atau penyalahgunaan layanan XAURIUS yang telah merugikan PT. Xaurius Aset Digital maupun sebab-sebab lain sesuai ketentuan PT. Xaurius Aset Digital.";

//ROMAWI XV
const String rom_15 = "XV. PERNYATAAN DAN KUASA";
const String rom_15_desc =
    "Pemberian Kuasa dari Pengguna dalam Ketentuan Umum ini diberikan dengan hak substitusi. Selama Pengguna menggunakan aplikasi/website Xaurius, maka kuasa tersebut tetap berlaku hingga berakhirnya penggunaan Xaurius, kuasa tersebut merupakan bagian yang tidak terpisahkan dari Ketentuan Umum ini.";
const String rom_15_num_1 =
    "1. PT. Xaurius Aset Digital memiliki kewenangan penuh untuk menolak atau menerima permohonan pembukaan Akun dan/atau layanan Xaurius yang diajukan oleh Pengguna atau calon Pengguna. Pengguna setuju bahwa atas data yang telah diberikan terkait permohonan pembukaan Akun dan/atau layanan tersebut tidak wajib dikembalikan kepada Pengguna.";
const String rom_15_num_2 = "2. Pengguna dengan ini menyatakan setuju atas hal-hal sebagai berikut: ";
const String rom_15_num_2_data =
    "a. Pengguna menjamin keikutsertaan Pengguna pada produk dan/atau layanan Xaurius dan/atau transaksi terkait produk/layanan bukan atas dasar persepsi bahwa Xaurius “XAU” adalah mata uang/alat bayar atau alat tukar yang bertentangan dengan peraturan perundang-undangan.\nb. Keikutsertaan Pengguna pada produk dan/atau layanan Xaurius dan/atau transaksi terkait produk/layanan adalah atas inisiatif Pengguna sendiri dan tidak ada paksaan dari pihak manapun.\nc. Pengguna menjamin keikutsertaan Pengguna pada produk dan/atau layanan Xaurius dan/atau transaksi terkait produk/layanan bukan atas dasar itikad buruk yaitu termasuk namun tidak terbatas pada niat Pengguna menyembunyikan, menempatkan, menyamarkan harta hasil tindak pidana “money laundering”, pendanaan ilegal, pendanaan terorisme, penghindaran pajak “tax avoidance” dan itikad buruk lainnya, dengan ini Pengguna juga membebaskan PT. Xaurius Aset Digital dari segala jeratan hukum atas itikad buruk Pengguna yang diketahui atau akan diketahui dikemudian hari.\nd. PT. Xaurius Aset Digital berhak melakukan pemeriksaan terhadap kebenaran data yang diberikan Pengguna dalam Aplikasi/website Pembukaan Akun/aplikasi/website untuk mengikuti layanan Xaurius/aplikasi/website sejenis dan berhak meminta data tambahan yang diperlukan oleh PT. Xaurius Aset Digital. Pengguna menjamin bahwa setiap data, keterangan/ informasi, dan tanda tangan yang tercantum dalam Formulir (termasuk Akun dan/atau layanan yang dibuka untuk kepentingan Beneficial Owner) dan/atau yang Pengguna berikan melalui media lain yang dikelola secara resmi oleh PT. Xaurius Aset Digital adalah benar, lengkap dan sah serta mengikat untuk setiap jenis Akun dan/atau layanan transaksi elektronik Xaurius Pengguna.\ne. Apabila dikemudian hari ditemukan ketidaksesuaian atas data, dan/atau keterangan/informasi yang telah diberikan Pengguna (termasuk identitas dan sumber dana dari Beneficial Owner), maka PT. Xaurius Aset Digital berhak dan berwenang penuh untuk menolak melaksanakan transaksi yang diinstruksikan Pengguna atau melakukan reversal atas transaksi yang telah dijalankan dan/atau  menutup Akun dan/atau layanan Xaurius yang dimiliki/dipilih Pengguna dengan pemberitahuan.\nf. Pengguna wajib untuk segera memberitahukan secara tertulis kepada PT. Xaurius Aset Digital dengan dilengkapi dokumen pendukung yang diperlukan atas setiap perubahan alamat, nomor telepon, NPWP, tanda tangan, dan hal-hal lain yang menyimpang/berbeda dari data/keterangan yang pernah diberikan Pengguna kepada PT. Xaurius Aset Digital berkaitan dengan Akun/layanan Pengguna. Untuk maksud perubahan data tersebut dapat dilakukan melalui counter Xaurius/Customer Service atau media lainnya yang ditentukan oleh PT. Xaurius Aset Digital setelah dilakukan otorisasi berdasarkan Akun, e-mail, Password atau tanda tangan. Kelalaian Pengguna tidak memberitahukan perubahan tersebut kepada PT. Xaurius Aset Digital, sepenuhnya merupakan tanggung jawab Pengguna.\ng. Pengguna bertanggung jawab penuh terhadap sanksi hukum yang timbul apabila dikemudian hari PT. Xaurius Aset Digital/Penyidik/PPATK atau instansi yang berwenang mengetahui bahwa data dan/atau keterangan/informasi yang telah diberikan Pengguna (termasuk identitas dan sumber dana dari Beneficial Owner) atau transaksi keuangan Pengguna tidak benar atau diduga berasal dari/merupakan hasil tindak pidana pencucian uang, dan/atau pendanaan ilegal, dan/atau penghindaran pajak.\nh. Pengguna wajib menyerahkan, dari waktu ke waktu, data nama-nama dan identitas dari pihak yang berwenang menandatangani segala dokumen yang diperlukan untuk mengakses data dan mengelola Akun atau memberikan instruksi terkait Akun dan layanan yang dipilih Pengguna (baik untuk Transaksional maupun Non Transaksional) yang pelaksanaan transaksinya dilakukan melalui kantor pusat PT. Xaurius Aset Digital, Customer Service Xaurius, Aplikasi/Website dan/atau layanan lainnya, termasuk surat kuasa dan dokumen terkait lainnya sesuai ketentuan  yang berlaku pada Xaurius.\ni. Pengguna menjamin bahwa pihak yang menandatangani dan/atau memberikan persetujuan terhadap dokumentasi terkait Akun Xaurius dan pengoperasian Akun dan/atau layanan yang dipilih Pengguna adalah pihak yang memiliki wewenang dan/atau kuasa yang sah untuk menandatangani, menyerahkan dan melaksanakan transaksi dan/atau layanan Xaurius.\nj. PT. Xaurius Aset Digital telah memberikan penjelasan yang cukup mengenai karakteristik produk dan/atau layanan Xaurius yang akan dimanfaatkan dan Pengguna menyatakan telah mengerti serta memahami segala konsekuensi pemanfaatan produk dan/atau layanan Xaurius, termasuk manfaat, risiko dan biaya yang timbul terkait dengan produk dan/atau layanan PT. Xaurius Aset Digital tersebut.";
const String rom_15_num_3 =
    "3. Pengguna dengan ini menyatakan bahwa pemberian informasi dan/atau data terkait pemilik Akun dan/atau Akun serta layanan Akun Pengguna (termasuk Beneficial Owner dan/atau Ultimate Beneficial Owner) kepada  aparat penegak hukum atau instansi lain yang berwenang akan dilakukan sesuai peraturan perundang-undangan yang berlaku.";
const String rom_15_num_4 =
    "4. Pengguna dengan ini memberikan persetujuan kepada PT. Xaurius Aset Digital untuk memberikan data pribadi Pengguna dalam hal diwajibkan untuk diberikan kepada instansi Kepolisian, Kejaksaan, Pengadilan, PPATK, KPK, Kantor Pajak atau instansi lain yang berwenang sesuai dengan peraturan perundang-undangan yang berlaku.";
const String rom_15_num_5 =
    "5. Apabila PT. Xaurius Aset Digital akan memberikan dan/atau menyebar-luaskan data pribadi Pengguna kepada pihak lain diluar PT. Xaurius Aset Digital dan grup Perusahaan Xaurius, maka PT. Xaurius Aset Digital akan meminta persetujuan tertulis terlebih dahulu dari Pengguna sesuai dengan ketentuan peraturan perundang-undangan yang berlaku.";
const String rom_15_num_6 =
    "6. Pengguna dengan ini setuju bahwa pembuktian atas transaksi Akun XAU “Xaurius” akan didasarkan pada verifikasi terhadap Password Akun atau penggunaan Link Verifikasi sesuai batasan limit dan spesifikasi produk yang ditentukan oleh PT. Xaurius Aset Digital. Dan pembuktian dengan proses verifikasi yang didasarkan pada Password Akun atau penggunaan Link Verifikasi sebagaimana tersebut diatas diakui Pengguna memiliki kekuatan hukum yang sama dengan perintah tertulis yang ditandatangani oleh Pengguna dan mengikat Pengguna, kecuali dapat dibuktikan sebaliknya.";
const String rom_15_num_7 =
    "7. Pengguna dengan ini menyatakan telah mengetahui dan menyadari sepenuhnya segala risiko yang timbul dari transaksi XAU “Xaurius”, baik yang dilakukan melalui Akun Xaurius, Merchant Trading Aset Kripto, atau tempat-tempat yang ditentukan oleh PT. Xaurius Aset Digital dan bertanggung jawab penuh atas seluruh transaksi yang telah dilakukan, termasuk jika terjadi penyalahgunaan Akun Xaurius, dan/atau layanan xaurius oleh sebab apapun juga, kecuali dapat dibuktikan bahwa kerugian yang timbul tersebut karena kesalahan/kelalaian Xaurius.";
const String rom_15_num_8 =
    "8. Pengguna dengan ini menjamin dan membebaskan PT. Xaurius Aset Digital dari segala kewajiban/klaim/tuntutan/gugatan ganti rugi apapun dari siapapun (termasuk dari Pengguna sendiri), sehubungan dengan:";
const String rom_15_num_8_data =
    "a. Dilakukannya pembatalan/pengakhiran/penutupan Akun Xaurius dalam hal terjadinya kondisi sebagaimana dimaksud dalam butir IV.10.\nb. Pelaksanaan semua instruksi dan transaksi yang dilakukan baik melalui media elektronik atau media lainnya yang disetujui oleh PT. Xaurius Aset Digital.\nc. Adanya kelalaian, sengaja melakukan kelalaian, fraud yang dilakukan oleh Pengguna atau pihak lain yang diinstruksikan oleh Pengguna.\nd. Terjadinya kondisi-kondisi sebagaimana dimaksud dalam butir XV.6 dan 7. ";
const String rom_15_num_9 =
    "9. Untuk layanan Xaurius yang terkait dengan informasi dan transaksi elektronik, Pengguna dengan ini menyatakan setuju atas hal-hal sebagai berikut:";
const String rom_15_num_9_data =
    "a. PT. Xaurius Aset Digital berhak untuk menyimpan setiap gambar Pengguna, instruksi Pengguna yang disampaikan melalui media elektronik serta hasil verifikasi PT. Xaurius Aset Digital dengan Pengguna atau Perwakilan Pengguna berkaitan dengan Akun dan/atau layanan xaurius yang Pengguna terima dari PT. Xaurius Aset Digital dalam bentuk dokumen elektronik. Dokumen tersebut disetujui sebagai bukti yang sah dan mengikat sesuai dengan peraturan perundang-undangan yang berlaku di bidang informasi dan transaksi elektronik, kecuali dapat dibuktikan sebaliknya.\nb. PT. Xaurius Aset Digital berhak untuk menggunakan infrastruktur, tenaga kerja, sistem/teknologi yang ada (baik dimiliki oleh PT. Xaurius Aset Digital maupun dalam rangka kerja sama dengan pihak lain) didalam menjalankan transaksi dan menjaga keamanan komunikasi, data Pengguna maupun data transaksi.";
const String rom_15_num_10 =
    "10. Pengguna dengan ini menyatakan tunduk dan terikat pada Syarat dan Ketentuan Umum ini, syarat-syarat dan ketentuan-ketentuan yang berkaitan dengan Akun dan/atau layanan xaurius, peraturan perundang-undangan dan kelaziman Penyelenggara Sistem Transaksi Elektronik yang berlaku di negara Republik Indonesia, serta ketentuan lain yang ditetapkan oleh regulator sehubungan dengan Aset Kripto “Aset Digital”, Saldo Poin, Perdagangan Komoditi Kripto Aset, ketentuan FATCA dan ketentuan lainnya berkaitan dengan layanan xaurius yang diberikan PT. Xaurius Aset Digital kepada Pengguna (termasuk namun tidak terbatas pada transaksi yang dilakukan melalui media elektronik).";
const String rom_15_num_11 =
    "11. Segala kuasa yang diberikan Pengguna dalam Syarat dan Ketentuan Umum ini diberikan dengan hak substitusi dan selama kewajiban-kewajiban Pengguna kepada PT. Xaurius Aset Digital belum dipenuhi sepenuhnya, maka kuasa-kuasa tersebut tidak dapat dicabut kembali ataupun tidak akan berakhir karena alasan apapun, termasuk tetapi tidak terbatas pada sebab-sebab yang disebut dalam pasal 1813 (Pemberian kuasa berakhir: dengan ditariknya kembali kuasanya si kuasa; dengan pemberitahuan penghentian kuasanya oleh si kuasa; dengan meninggalnya, pengampuannya atau pailitnya si pemberi kuasa maupun si kuasa), 1814 (Si Pemberi Kuasa dapat menarik kembali kuasanya manakala itu dikehendakinya, dan jika ada alasan untuk itu, memaksa si kuasa untuk mengembalikan kuasa yang dipegangnya) dan 1816 (Pengangkatan seorang kuasa baru, untuk menjalankan suatu urusan yang sama, menyebabkan ditariknya kembali kuasa yang pertama, terhitung mulai diberitahukannya kepada orang yang belakangan ini tentang pengangkatan tersebut) Kitab Undang-Undang Hukum Perdata dan kuasa-kuasa tersebut merupakan bagian yang tidak terpisahkan dari Syarat dan Ketentuan Umum ini.";
const String rom_15_add =
    "Pengguna dengan ini setuju bahwa PT. Xaurius Aset Digital dapat menyerahkan/mengalihkan pekerjaan kepada pihak ketiga (termasuk perusahaan grup Xaurius/afiliasi) untuk menunjang kegiatan PT. Xaurius Aset Digital didalam menyediakan produk/layanan untuk Pengguna, dengan tetap memperhatikan peraturan perundang-undangan yang berlaku.";

//ROMAWI XVI
const String rom_16 = "XVI. LARANGAN";
const String rom_16_num_1 =
    "1. Hak penggunaan akun dalam aplikasi/website Xaurius ini tidak boleh dialihkan dengan alasan apapun juga, baik sebagian atau seluruhnya, untuk sementara atau selamanya, kepada pihak lain tanpa persetujuan tertulis terlebih dahulu dari PT. Xaurius Aset Digital. Pengguna bertanggung jawab atas segala bentuk penyalahgunaan Xaurius.";
const String rom_16_num_2 =
    "2. Pengguna dilarang menggunakan Xaurius “XAU” sebagai suatu mata uang yang digunakan sebagai alat bayar/alat tukar/alat jaminan atas pembayaran kepada pihak lain atau pihak manapun, dan segala resiko akibat penyalahgunaan Xaurius “XAU” sebagaimana dimaksud dalam butir ini ditanggung oleh Pengguna.";
const String rom_16_num_3 =
    "3. Pengguna dilarang memberitahukan kepada siapapun dan dengan cara apapun juga terkait Password, Link Verifikasi, serta keterangan, dokumen dan apapun yang diterima Pengguna, selama dan setelah penggunaan aplikasi/website Xaurius berlangsung.";
const String rom_16_num_4 =
    "4. Pengguna mengetahui dan dengan ini menyetujui bahwa tiap-tiap pelanggaran atas ketentuan sebagaimana dimaksud pada butir XVI mengenai Larangan angka 1, 2 dan 3. Ketentuan Umum ini menimbulkan hak bagi PT. Xaurius Aset Digital untuk menghentikan/mengakhiri aplikasi/website Xaurius yang telah digunakan Pengguna dengan pemberitahuan terlebih dahulu dan membebankan denda kepada pengguna atas biaya atau kerugian yang diderita PT. XAURIUS ASET DIGITAL dan/atau sesuai peraturan dan perundang-undangan yang berlaku.";

//ROMAWI XVII
const String rom_17 = "XVII. FORCE MAJEURE";
const String rom_17_num_1 =
    "1. Tidak ada satu pihakpun yang dinyatakan telah melakukan kelalaian/pelanggaran terhadap isi/ketentuan ini apabila hal tersebut disebabkan karena force Majeure.";
const String rom_17_num_2 =
    "2. Hal-hal yang termasuk force Majeure dalam Perjanjian ini adalah peristiwa atau kejadian yang berada di luar kemampuan manusia, termasuk namun tidak terbatas pada sabotase, peperangan, dikeluarkannya peraturan/kebijaksanaan Pemerintah, bencana alam, huru-hara, epidemi, kebakaran dan tidak dapat digunakannya aplikasi/website Xaurius karena terjadinya disaster yang antara lain disebabkan oleh perangkat/peralatan PT. Xaurius Aset Digital mengalami gangguan listrik atau komunikasi atau sistem terkena virus. ";
const String rom_17_num_3 =
    "3. Dalam hal terjadi Force Majeure terhadap  salah satu  pihak, maka pihak itu  berkewajiban segera mungkin  memberitahukan pihak lainnya dengan cara apapun yang mungkin atas timbulnya keadaan Force Majeure tersebut, menyampaikan pemberitahuan selambat-lambatnya 3 (tiga) hari kerja terhitung setelah berakhirnya keadaan Force Majeure tersebut.";
const String rom_17_num_4 =
    "4. Apabila pihak yang mengalami keadaan Force Majeure tersebut lalai untuk memberitahukan kepada pihak lainnya dalam kurun waktu sebagaimana ditentukan dalam Ketentuan Umum ini, maka seluruh kerugian yang mungkin timbul menjadi heban dan tanggung jawab pihak yang mengalami Force Majeure tersebut.";

//ROMAWI XVIII
const String rom_18 = "XVIII. MEDIA PEMBERITAHUAN TRANSAKSI";
const String rom_18_desc =
    "Hal-hal yang berkaitan dengan media komunikasi transaksi yang digunakan adalah Inbox (Kotak Pesan) masing-masing Fasilitas/Layanan Channel Elektronik PT. Xaurius Aset Digital, Halaman Muka/Dashboard atau kolom berita website, SMS, maupun E-mail.";

//ROMAWI XIX
const String rom_19 = "XIX. HUKUM YANG BERLAKU DAN JURISDIKSI";
const String rom_19_num_1 =
    "1. Peraturan, Syarat dan Ketentuan Umum Xaurius menggunakan Bahasa Indonesia, dan dapat diterjemahkan ke dalam bahasa asing, namun terhadap perbedaan persepsi dan penafsiran dalam bahasa dan tulisan, maka akan merujuk Bahasa Indonesia.";
const String rom_19_num_2 =
    "2. Keabsahan, penafsiran, dan pelaksanaan dari Ketentuan Umum Xaurius diatur dan tunduk pada hukum yang berlaku di negara Republik Indonesia.";
const String rom_19_num_3 =
    "3. Terhadap seluruh perjanjian dan kesepakatan Pihak lain dengan Pihak PT. XAURIUS ASET DIGITAL berlaku ketentuan ini dan terhadap sengketa atas perikatan tersebut maka ditentukan terlebih dahulu diselesaikan secara Arbitrase melalui Badan Arbitrasi Nasional Indonesia dengan tidak mengurangi hak PT. Xaurius Aset Digital untuk melakukan Upaya Hukum lain termasuk Gugatan pada Pengadilan Berwenang.";
const String rom_19_num_4 =
    "4. Terhadap hal-hal terkait sengketa yang terjadi baik di dalam maupun diluar Wilayah Hukum Yuridiksi Indonesia maka terhadap tersebut ditentukan Hukum yang dipilih adalah Hukum/Upaya Hukum yang berlaku di Negara Republik Indonesia dan/atau dengan mengadopsi Hukum Internasional yang telah diratifikasi oleh Hukum Indonesia.";
const String rom_19_num_5 =
    "5. Hal-hal yang berkaitan dengan Ketentuan Umum ini dan segala akibatnya, Pengguna memilih domisili hukum yang tetap dan seumumnya pada Kantor Kepaniteraan Pengadilan Negeri Jakarta Pusat, yang demikian dengan tidak mengurangi hak PT. Xaurius Aset Digital/Pengguna untuk mengajukan gugatan/tuntutan hukum kepada salah satu pihak di hadapan pengadilan-pengadilan lain di manapun juga di seluruh Indonesia sesuai dengan ketentuan hukum yang berlaku.";

//ROMAWI XX
const String rom_20 = "XX. PROSEDUR PENGAJUAN PENGADUAN ATAS LAYANAN XAURIUS";
const String rom_20_num_1 =
    "1. Pengguna dapat mengajukan pengaduan atas ketidakpuasan Pengguna terhadap Layanan Xaurius melalui Customer Service Xaurius : 081288989821 (GSM) atau e-mail : info@xaurius.com";
const String rom_20_num_2 = "2. Prosedur mengenai layanan Pengaduan Pengguna dapat diakses melalui website  https://www.xaurius.com";
const String rom_20_num_3 =
    "3. Pengguna dan/atau Perwakilan Pengguna dapat mengajukan pengaduan atas transaksi/layanan xaurius kepada PT. Xaurius Aset Digital (kantor pusat atau Customer Service Xaurius) secara lisan maupun secara tertulis. Dalam hal Pengguna dan/atau Perwakilan Pengguna mengajukan pengaduan secara lisan, maka PT. Xaurius Aset Digital akan melakukan verifikasi pada saat pengaduan disampaikan oleh Pengguna dan/atau Perwakilan Pengguna.";
const String rom_20_num_4 =
    "4. Dalam hal penyelesaian pengaduan secara lisan tidak dapat diselesaikan dalam jangka waktu 5 (lima) hari kerja sejak pengaduan diterima oleh PT. Xaurius Aset Digital, maka PT. Xaurius Aset Digital berhak meminta kepada Pengguna dan/atau Perwakilan Pengguna untuk mengajukan pengaduan secara tertulis dengan disertai dokumen pendukung yang dipersyaratkan oleh PT. Xaurius Aset Digital. Pengguna dianggap setuju dengan seluruh kondisi peristiwa yang olehnya diadukan jika Pengaduan secara tertulis dan dokumen pendukungnya tidak dipenuhi dalam jangka waktu 5 (lima) hari kerja. ";
const String rom_20_num_5 =
    "5. Pengaduan tertulis yang diajukan oleh Pengguna  dan/atau Perwakilan Pengguna akan diselesaikan dan pemberitahuannya akan disampaikan secara tertulis kepada Pengguna paling lama 20 (dua puluh) hari kerja sejak dokumen terkait dengan Pengaduan Pengguna diterima secara lengkap oleh PT. Xaurius Aset Digital.";
const String rom_20_num_6 =
    "6. Dalam hal Pengguna dan/atau Perwakilan Pengguna belum dapat memenuhi dokumen yang dipersyaratkan, maka PT. Xaurius Aset Digital akan menginformasikan kepada Pengguna dan/atau Perwakilan Pengguna untuk melengkapinya dan memberikan waktu maksimal 20 (dua puluh) hari kerja dan tambahan 20 (dua puluh) hari kerja apabila:";
const String rom_20_num_6_data =
    "a. Dokumen yang diperlukan tidak berada pada domisili Pengguna; dan/atau\nb. Terdapat hal lain diluar kendali Pengguna.";
const String rom_20_num_7 =
    "7. PT. Xaurius Aset Digital berhak memperpanjang waktu penyelesaian pengaduan tersebut hingga 20 (dua puluh) hari kerja berikutnya dengan pemberitahuan secara tertulis kepada Pengguna dan/atau Perwakilan Pengguna, apabila terdapat hal-hal sebagai berikut:";
const String rom_20_num_7_data =
    "a. Kantor Xaurius yang menerima pengaduan tidak sama dengan tempat terjadinya permasalahan yang diadukan dan terdapat kendala komunikasi diantara kedua tempat tersebut.\nb. Pengaduan memerlukan penelitian khusus terhadap dokumen PT. Xaurius Aset Digital.\nc. Terjadi Force Majeure sebagaimana dimaksud dalam butir XVII Syarat dan Ketentuan Umum ini dan/atau terjadi sebab-sebab lain diluar kendali PT. Xaurius Aset Digital dan dalam hal ini PT. Xaurius Aset Digital telah melakukan langkah-langkah perbaikan yang wajar sesuai kelaziman dalam praktik penyelenggara system transaksi elektronik.\nd. PT. Xaurius Aset Digital dapat juga menyelesaikan pengaduan diluar jangka waktu 2 (dua) kali 20 (dua puluh) hari kerja, jika penyelesaian pengaduan memerlukan tindak lanjut oleh pihak lain dan tindak lanjut tersebut mempengaruhi jangka waktu penyelesaian pengaduan. PT. Xaurius Aset Digital akan memberitahukan secara tertulis kepada Pengguna dan/atau Perwakilan Pengguna setiap terjadinya perpanjangan waktu penyelesaian pengaduan.";
const String rom_20_num_8 =
    "8. Apabila Pengguna dan/atau Perwakilan Pengguna mengajukan pengaduan secara tertulis, Pengguna dan/atau Perwakilan Pengguna wajib melengkapi dokumen sebagai berikut: surat kuasa khusus (apabila dikuasakan); jenis dan tanggal transaksi; dan permasalahan yang diadukan (tercantum dalam formulir yang diisi oleh Pengguna). Untuk dokumen lain yang dipersyaratkan, dapat mengakses website PT. Xaurius Aset Digital melalui: https://www.xaurius.com";
const String rom_20_num_9 =
    "9. PT. Xaurius Aset Digital wajib menyediakan informasi mengenai status penanganan pengaduan pada saat Pengguna dan/atau Perwakilan Pengguna meminta penjelasan kepada PT. Xaurius Aset Digital mengenai pengaduan yang diajukan.";
const String rom_20_num_10 = "10. PT. Xaurius Aset Digital dapat menolak menangani pengaduan jika:";
const String rom_20_num_10_data =
    "a. Pengguna dan/atau perwakilan Pengguna tidak melengkapi persyaratan dokumen sesuai dengan jangka waktu yang telah ditetapkan;\nb. Pengaduan sebelumnya telah diselesaikan oleh PT. Xaurius Aset Digital sesuai dengan ketentuan perundang-undangan yang berlaku;\nc. Pengaduan tidak terkait dengan kerugian dan/atau potensi kerugian materiil, wajar, dan secara langsung sebagaimana tercantum dalam perjanjian dan/atau dokumen transaksi XAU; dan/atau\nd. Pengaduan tidak terkait dengan Transaksi Elektronik Xaurius yang dikeluarkan oleh PT. Xaurius Digital Aset yang bersangkutan.";
const String rom_20_num_11 =
    "11. Dalam hal pengaduan disampaikan secara tertulis, PT. Xaurius Aset Digital akan menyampaikan tanggapan pengaduan secara tertulis. Kemudian apabila pengaduan disampaikan secara lisan, PT. Xaurius Aset Digital akan menyampaikan tanggapan pengaduan secara lisan dan/atau tertulis.";
const String rom_20_num_12 =
    "12. Dalam hal Pengguna dan/atau Perwakilan Pengguna menyampaikan keberatan terhadap tanggapan pengaduan dan/atau menyampaikan dokumen baru yang dapat mengakibatkan perubahan tanggapan pengaduan, maka PT. Xaurius Aset Digital wajib menyelesaikan keberatan tersebut dalam jangka waktu sebagaimana diatur dalam ketentuan butir 5 dan 7.";
const String rom_20_num_13 =
    "13. Dalam hal Pengguna dan/atau Perwakilan Pengguna menolak tanggapan pengaduan dari PT. Xaurius Aset Digital maka Pengguna dan/atau Perwakilan Pengguna dapat melakukan upaya penyelesaian sengketa sesuai dengan ketentuan pada bagian Hukum yang Berlaku dan Yurisdiksi dalam Syarat dan Ketentuan Umum ini.";

//ROMAWI XXI
const String rom_21 = "XXI. LAIN-LAIN";
const String rom_21_num_1 =
    "1. Dengan ini PT. Xaurius Aset Digital dan Pengguna sepakat dan setuju terhadap aplikasi/website PT. Xaurius Aset Digital yang disediakan PT. Xaurius Aset Digital kepada Pengguna berlaku Ketentuan Umum ini.";
const String rom_21_num_2 =
    "2. Ketentuan Umum ini merupakan bagian yang tidak terpisahkan dari Syarat dan Ketentuan Umum Akun dan Layanan Transaksi pembelian/penjualan XAU, serta Syarat dan Ketentuan Umum untuk masing-masing Fasilitas/ Layanan perbankan untuk masing-masing produk/layanan yang berlaku pada PT. Xaurius Aset Digital.";
const String rom_21_num_3 =
    "3. Jika ada satu ketentuan dalam Ketentuan Umum ini yang oleh karena suatu ketetapan Pemerintah atau pengadilan dilarang atau tidak dapat dilaksanakan atau menjadi tidak berlaku atau dinyatakan batal demi hukum, hal tersebut tidak mempengaruhi keabsahan ketentuan lainnya dalam  Ketentuan Umum  ini, dan ketentuan-ketentuan lainnya tersebut tetap berlaku dan mengikat serta dapat dilaksanakan sebagaimana ditentukan dalam Ketentuan Umum ini. Terkait dengan hal tersebut Pengguna wajib membuat dan menandatangani dokumen yang berisikan ketentuan yang memenuhi persyaratan PT. Xaurius Aset Digital sebagai pengganti ketentuan yang dilarang atau tidak dapat dilaksanakan tersebut.";
const String rom_21_num_4 =
    "4. Dalam hal terdapat inkonsistensi antara Ketentuan Umum ini dengan media pemasaran (termasuk namun tidak terbatas pada brosur, syarat dan ketentuan ketentuan produk), para pihak sepakat bahwa ketentuan yang berlaku adalah sebagaimana diatur dalam Ketentuan Umum ini.";
const String rom_21_num_5 =
    "5. PT. Xaurius Aset Digital akan menginformasikan dalam hal terdapat perubahan manfaat, biaya, risiko biaya dan Ketentuan Umum ini kepada Pengguna melalui media komunikasi yang tersedia pada PT. Xaurius Aset Digital paling lambat 30 (tiga puluh) hari kerja sebelum perubahan tersebut dilakukan dan dalam hal Pengguna tidak setuju dengan adanya perubahan tersebut, maka Pengguna dapat mengirimkan pernyataan keberatannya kepada PT. Xaurius Aset Digital dalam waktu 30 (tiga puluh) hari kerja terhitung sejak perubahan dikirimkan/diumumkan melalui media komunikasi yang tersedia pada PT. Xaurius Aset Digital. Apabila Pengguna tidak menyetujui Perubahan tersebut, Pengguna berhak menutup produk dan/atau layanan yang telah diperoleh dengan terlebih dahulu menyelesaikan seluruh kewajiban Pengguna yang masih terhutang kepada PT. Xaurius Aset Digital. Dengan lewatnya waktu tersebut di atas, Pengguna setuju bahwa PT. Xaurius Aset Digital akan menganggap Pengguna menyetujui perubahan tersebut.";
const String rom_21_num_6 =
    "6. Judul dan istilah-istilah yang dipergunakan dalam Ketentuan Umum ini semata-mata bertujuan untuk mempermudah pemahaman atas isi aplikasi/website Xaurius ini.";
const String rom_21_num_7 =
    "7. Terhadap fasilitas/layanan transaksi lainnya yang tidak diatur dalam Ketentuan Umum ini, akan diatur secara terpisah dan merupakan satu kesatuan serta bagian yang tidak terpisahkan dari Ketentuan Umum ini.";
const String rom_21_num_8 =
    "8. Syarat dan Ketentuan Umum ini telah disesuaikan dengan ketentuan peraturan perundang-undangan termasuk ketentuan peraturan Kementrian Komunikasi dan Informatika Republik Indonesia, peraturan Badan Pengawas Perdagangan Berjangka republik Indonesia dan Komoditi dan peraturan Penyelengaraan Sistem dan Transaksi Elektronik di Indonesia.";
const String rom_21_num_9 = "9. PT. Xaurius Aset Digital Indonesia merupakan penyelenggara Komoditas Aset Kripto/Digital Xaurius Token “XAU Token”.";

//ROMAWI XXII
const String rom_22 = "XXII. PERINGATAN";
const String rom_22_desc =
    "Hati-hati terhadap penipuan. Pastikan Anda berhati-hati dan tidak tertipu oleh oknum-oknum yang mengatasnamakan PT. Xaurius Aset Digital dengan menjanjikan Hadiah. Segala bentuk penipuan ataupun perbuatan lainnya yang dilakukan oleh pihak lain/ketiga yang dikaitkan dengan aplikasi/website Xaurius ini berada di luar kewenangan PT. Xaurius Aset Digital.";

//LAYANAN INFORMASI
const String rom_23 = "LAYANAN INFORMASI";
const String rom_23_data = "CS XAURIUS : 081288989821\nAlamat email : info@xaurius.com\nWebsite : www.xaurius.com";
