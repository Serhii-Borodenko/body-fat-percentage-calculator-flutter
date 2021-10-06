import 'package:flutter/material.dart';
import 'package:body_fat_percentage/constants.dart';

class InputCard extends StatelessWidget {
  InputCard(
      {this.cardMargin,
      this.color,
      this.cardTitle,
      this.onPress,
      this.cardIcon,
      this.cardChild,
      this.cardChildIconButtonBack,
      this.cardChildIconButtonForward});
  final EdgeInsets cardMargin;
  final Color color;
  final String cardTitle;
  final Function onPress;
  final IconData cardIcon;
  final Widget cardChild;
  final Widget cardChildIconButtonBack;
  final Widget cardChildIconButtonForward;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          margin: cardMargin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kMainBorderRadius),
            color: color,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(child: cardChildIconButtonBack),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cardTitle,
                    style: TextStyle(
                        fontSize: cardTitleFontSize,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                  Container(child: cardChild)
                ],
              ),
              Container(child: cardChildIconButtonForward),
            ],
          ),
        ),
      ),
    );
  }
}
