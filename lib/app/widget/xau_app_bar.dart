import 'package:flutter/material.dart';

class XauAppBar extends StatefulWidget {
  final Widget title;
  final Widget leading;
  final List<Widget> actions;

  const XauAppBar({Key key, this.title, this.leading, this.actions}) : super(key: key);

  @override
  _XauAppBarState createState() => _XauAppBarState();
}

class _XauAppBarState extends State<XauAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widget.title,
      leading: widget.leading,
      actions: widget.actions,
    );
  }
}
