import 'package:flutter/material.dart';

class InterfaceUtilities{
  static const double screenPadding = 15.0;
  static const double containerPadding = 5.0;

  static double borderRadius = 5.0;

  static double elevation = 5.0;

  static double dividerHeightSmall = 13.0;
  static double dividerHeightMedium = 23.0;
  static double dividerHeightLarge = 55.0;
  static double dividerHeightExtraLarge = 110.0;

  static double getPercentageOfScreenHeight(BuildContext context, double percentage)
  {
    return MediaQuery.of(context).size.height * percentage;
  }

  static double getPercentageOfScreenWidth(BuildContext context, double percentage)
  {
    return MediaQuery.of(context).size.width * percentage;
  }

  static double getScaledFontSize(BuildContext context, double fontSize)
  {
    return MediaQuery.of(context).size.height * (fontSize/100);
  }
}