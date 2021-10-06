import 'package:body_fat_percentage/components/slider_card_info_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:body_fat_percentage/components/input_card.dart';
import 'package:body_fat_percentage/constants.dart';
import 'package:body_fat_percentage/components/slider_container.dart';
import 'card_Child_Button_Back.dart';
import 'package:body_fat_percentage/components/card_Child_Button_Back.dart';
import 'package:body_fat_percentage/components/bottom_button.dart';
import 'package:body_fat_percentage/components/result_screen.dart';
import 'package:body_fat_percentage/calculator_brain.dart';

enum Gender { male, female }
enum AlertInfo { neck, waist, hip }

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Gender selectedGender;
  AlertInfo selectedAlert;
  String alertTitle;
  int age = 19;
  int height = 170;
  int neck = 40;
  int waist = 80;
  int hip = 80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Navy Body Fat Calculator',
          style: TextStyle(
              fontFamily: 'Montserrat', color: Colors.black, fontSize: 25.0),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InputCard(
                    cardMargin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                    cardTitle: 'male'.toUpperCase(),
                    cardChild: Icon(FontAwesomeIcons.mars, size: cardIconSize),
                    onPress: () {
                      setState(
                        () {
                          selectedGender = Gender.male;
                        },
                      );
                    },
                    color: selectedGender == Gender.male
                        ? kMainBackColor
                        : kInActiveCardBackColor,
                  ),
                  InputCard(
                    cardMargin: EdgeInsets.only(left: 10.0, bottom: 10.0),
                    cardTitle: 'female'.toUpperCase(),
                    cardChild: Icon(FontAwesomeIcons.venus, size: cardIconSize),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kMainBackColor
                        : kInActiveCardBackColor,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  SliderContainer(
                    sliderTitle: 'neck'.toUpperCase(),
                    color: kMainBackColor,
                    sliderValue: Text(
                      neck.toString(),
                      style: kSliderValueStyle,
                    ),
                    sliderCardInfoButton: SliderCardInfoButton(
                      onPressInfoButton: () {
                        selectedAlert = AlertInfo.neck;
                        return selectedAlert;
                      },
                    ),
                    containerChild: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFf3ad70),
                        activeTrackColor: Color(0xFFf3ad70),
                        inactiveTrackColor: Color(0xFFffe0c9),
                        overlayColor: Color(0x4dffe0c9),
                        trackHeight: 2.0,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 8.0,
                        ),
                      ),
                      child: Slider(
                        value: neck.toDouble(),
                        min: 30,
                        max: 70,
                        onChanged: (double newValue) {
                          setState(() {
                            neck = newValue.round();
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SliderContainer(
                      sliderTitle: 'waist'.toUpperCase(),
                      color: kMainBackColor,
                      sliderValue: Text(
                        waist.toString(),
                        style: kSliderValueStyle,
                      ),
                      sliderCardInfoButton: SliderCardInfoButton(
                        onPressInfoButton: () {
                          selectedAlert = AlertInfo.waist;
                          return selectedAlert;
                        },
                      ),
                      containerChild: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xFFf3ad70),
                          activeTrackColor: Color(0xFFf3ad70),
                          inactiveTrackColor: Color(0xFFffe0c9),
                          overlayColor: Color(0x4dffe0c9),
                          trackHeight: 2.0,
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 8.0,
                          ),
                        ),
                        child: Slider(
                          value: waist.toDouble(),
                          min: 40,
                          max: 150,
                          onChanged: (double newValue) {
                            setState(() {
                              waist = newValue.round();
                            });
                          },
                        ),
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  SliderContainer(
                    sliderTitle: 'hips'.toUpperCase(),
                    color: selectedGender == Gender.female
                        ? kMainBackColor
                        : kInActiveCardBackColor,
                    sliderValue: Text(
                      hip.toString(),
                      style: kSliderValueStyle,
                    ),
                    sliderCardInfoButton: SliderCardInfoButton(
                      onPressInfoButton: () {
                        selectedAlert = AlertInfo.hip;
                        return selectedAlert;
                      },
                    ),
                    containerChild: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: selectedGender == Gender.female
                            ? Color(0xFFf3ad70)
                            : kInActiveCardBackColor,
                        activeTrackColor: selectedGender == Gender.female
                            ? Color(0xFFf3ad70)
                            : kMainBackColor,
                        inactiveTrackColor: selectedGender == Gender.female
                            ? Color(0xFFffe0c9)
                            : kMainBackColor,
                        overlayColor: Color(0x4dffe0c9),
                        trackHeight: 2.0,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 8.0,
                        ),
                      ),
                      child: Slider(
                        value: hip.toDouble(),
                        min: 50,
                        max: 140,
                        onChanged: (double newValue) {
                          setState(() {
                            hip = newValue.round();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  InputCard(
                    cardMargin: EdgeInsets.only(right: 10.0, top: 10.0),
                    color: kMainBackColor,
                    cardTitle: 'height'.toUpperCase() + ' cm',
                    cardChildIconButtonBack: CardChildButtonBack(
                      onTap: () {
                        setState(() {
                          height <= 100 ? height = 220 : height--;
                        });
                      },
                    ),
                    cardChildIconButtonForward: CardChildButtonForward(
                      onTap: () {
                        setState(() {
                          height >= 220 ? height = 100 : height++;
                        });
                      },
                    ),
                    cardChild: Text(
                      height.toString(),
                      style: TextStyle(
                          fontSize: cardFontSize,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  InputCard(
                    cardMargin: EdgeInsets.only(left: 10.0, top: 10.0),
                    color: kMainBackColor,
                    cardTitle: 'age'.toUpperCase(),
                    cardChildIconButtonBack: CardChildButtonBack(
                      onTap: () {
                        setState(
                          () {
                            age <= 18 ? age = 99 : age--;
                          },
                        );
                      },
                    ),
                    cardChild: Text(
                      age.toString(),
                      style: TextStyle(
                          fontSize: cardFontSize,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                    cardChildIconButtonForward: CardChildButtonForward(
                      onTap: () {
                        setState(() {
                          age >= 99 ? age = 18 : age++;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc = CalculatorBrain(
                    gender: selectedGender,
                    neck: neck,
                    waist: waist,
                    hip: hip,
                    height: height,
                    age: age);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultScreen(
                        resultStyle: calc.checkResult(),
                        titleResult: selectedGender == null
                            ? 'Tap on icon to select gender!'
                            : 'Your result!',
                        bfpResult: selectedGender == null
                            ? ''
                            : calc.getResult().toString() + '%',
                        resultText:
                            selectedGender == null ? '' : calc.getDescription(),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
