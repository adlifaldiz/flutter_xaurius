import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';

class Item1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: backgroundPanelColor.withOpacity(0.8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Meet',
                  style: TextStyle(color: textWhiteColor, fontWeight: FontWeight.bold, fontSize: 20),
                  children: [
                    TextSpan(
                      text: ' Xaurius',
                      style: TextStyle(color: accentColor, fontWeight: FontWeight.normal, fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  text: 'The future of',
                  style: TextStyle(color: textWhiteColor, fontWeight: FontWeight.bold, fontSize: 20),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Gold',
                      style: TextStyle(color: accentColor, fontWeight: FontWeight.normal, fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'In Xaurius, we provide trusted Gold Backed Cryptocurrency. Which is Easier to store, transferable, divisible, and reedemable with real physical Gold',
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: textWhiteColor,
                      fontSize: 14,
                    ),
                overflow: TextOverflow.visible,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
