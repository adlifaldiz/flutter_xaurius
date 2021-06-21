import 'dart:ui';

import 'package:flutter/material.dart';

class XauriusCard extends StatelessWidget {
  final Widget child;
  final double radius;

  const XauriusCard({@required this.child, this.radius});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: child,
      ),
    );
  }
}
