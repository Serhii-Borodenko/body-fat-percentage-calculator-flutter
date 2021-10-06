import 'package:flutter/material.dart';
import 'package:body_fat_percentage/constants.dart';
import 'package:body_fat_percentage/components/bottom_button.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({
    @required this.titleResult,
    @required this.bfpResult,
    @required this.resultText,
    this.resultStyle,
  });
  final String titleResult;
  final String bfpResult;
  final String resultText;
  final bool resultStyle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculation Result',
          style: TextStyle(
              fontFamily: 'Montserrat', color: Colors.black, fontSize: 25.0),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kMainBorderRadius),
                  color: kMainBackColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      titleResult,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.w100),
                    ),
                    Text(
                      bfpResult,
                      style: resultStyle ? kSuccessStyle : kFailStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        resultText,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonTitle: 'RECALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
