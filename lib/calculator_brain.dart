import 'dart:math';

import 'package:body_fat_percentage/components/input_screen.dart';
import 'components/alert_content.dart';

class CalculatorBrain {
  CalculatorBrain(
      {this.gender, this.neck, this.waist, this.hip, this.height, this.age});

  final gender;
  final int age;
  final int height;
  final int neck;
  final int waist;
  final int hip;

  int bfpMen() {
    int result = (495 /
                (1.0324 -
                    0.19077 * (log(waist - neck) / ln10) +
                    0.15456 * (log(height) / ln10)) -
            450)
        .round();
    return result > 0 ? result : 0;
  }

  int bfpWomen() {
    int result = (495 /
                (1.29579 -
                    0.35004 * (log(waist + hip - neck) / ln10) +
                    0.22100 * (log(height) / ln10)) -
            450)
        .round();
    return result > 0 ? result : 0;
  }

  int getResult() {
    return gender == Gender.male ? bfpMen() : bfpWomen();
  }

  bool checkResult() {
    if ((gender == Gender.male && age <= 21 && getResult() <= 22) ||
        (gender == Gender.male && age <= 29 && getResult() <= 23) ||
        (gender == Gender.male && age <= 39 && getResult() <= 24) ||
        (gender == Gender.male && age >= 40 && getResult() <= 26) ||
        (gender == Gender.female && age <= 21 && getResult() <= 33) ||
        (gender == Gender.female && age <= 29 && getResult() <= 34) ||
        (gender == Gender.female && age <= 39 && getResult() <= 35) ||
        (gender == Gender.female && age >= 40 && getResult() <= 36)) {
      return true;
    }
    return false;
  }

  String getDescription() {
    return checkResult() ? descriptionContent[0] : descriptionContent[1];
  }
}
