import 'package:flutter/material.dart';

class NoConnection extends StatefulWidget {
  final VoidCallback ontap;

  const NoConnection({Key key, this.ontap}) : super(key: key);
  @override
  _NoConnectionState createState() => _NoConnectionState();
}

class _NoConnectionState extends State<NoConnection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.red,
      child: Center(
        child: FlatButton(
          color: Colors.white,
          onPressed: widget.ontap,
          child: Text('Retry'),
        ),
      ),
    );
  }
}
