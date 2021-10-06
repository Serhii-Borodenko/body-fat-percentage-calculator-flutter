import 'package:flutter/material.dart';

class CardChildButtonBack extends StatelessWidget {
  CardChildButtonBack({this.onTap});
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        constraints: BoxConstraints(minHeight: 70, minWidth: 35),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        padding: EdgeInsets.zero,
        icon: Icon(Icons.arrow_back_ios),
        onPressed: onTap);
  }
}

class CardChildButtonForward extends StatelessWidget {
  CardChildButtonForward({this.onTap});
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        constraints: BoxConstraints(minHeight: 70, minWidth: 35),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        padding: EdgeInsets.zero,
        icon: Icon(Icons.arrow_forward_ios),
        onPressed: onTap);
  }
}
