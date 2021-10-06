import 'package:flutter/material.dart';
import 'package:body_fat_percentage/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:body_fat_percentage/components/input_screen.dart';
import 'package:body_fat_percentage/components/alert_content.dart';

class SliderCardInfoButton extends StatelessWidget {
  SliderCardInfoButton({this.onPressInfoButton});

  final Function onPressInfoButton;
  @override
  Widget build(BuildContext context) {
    String alertTitle;
    String alertDiscription;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          switch (onPressInfoButton()) {
            case AlertInfo.neck:
              alertTitle = alertContent[0];
              alertDiscription = alertContent[1];
              break;
            case AlertInfo.waist:
              alertTitle = alertContent[2];
              alertDiscription = alertContent[3];
              break;
            case AlertInfo.hip:
              alertTitle = alertContent[4];
              alertDiscription = alertContent[5];
              break;
          }

          Alert(
            context: context,
            type: AlertType.info,
            title: alertTitle,
            desc: alertDiscription,
            buttons: [
              DialogButton(
                color: Color(0xFFe3ebed),
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 20,
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kMainBorderRadius),
            color: Color(0xFFe3ebed),
          ),
          margin: EdgeInsets.fromLTRB(5, 5, 5, 15),
          alignment: Alignment.center,
          child: Icon(
            Icons.info_outline,
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
}
