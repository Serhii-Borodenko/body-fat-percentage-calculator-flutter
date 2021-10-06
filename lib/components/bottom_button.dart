import 'package:flutter/material.dart';
import 'package:body_fat_percentage/constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  BottomButton({this.buttonTitle, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kMainBorderRadius),
            color: kBottomContainerColor,
          ),
          child: Center(
            child: Text(buttonTitle, style: kLargeButtonStyle),
          ),
          margin: EdgeInsets.only(top: 10.0),
        ),
      ),
    );
  }
}
