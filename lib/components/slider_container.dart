import 'package:flutter/material.dart';
import 'package:body_fat_percentage/constants.dart';

class SliderContainer extends StatelessWidget {
  SliderContainer(
      {this.sliderTitle,
      this.sliderValue,
      this.containerChild,
      this.sliderCardInfoButton,
      this.color});

  final String sliderTitle;
  final Widget sliderValue;
  final Widget containerChild;
  final Widget sliderCardInfoButton;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMainBorderRadius),
          color: color,
        ),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0.0),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Expanded(
                          child: Text(
                            sliderTitle,
                            style: TextStyle(
                                fontSize: cardTitleFontSize,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                        sliderValue,
                        Text(
                          'cm',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  containerChild,
                ],
              ),
            ),
            Container(child: sliderCardInfoButton)
          ],
        ),
      ),
    );
  }
}
