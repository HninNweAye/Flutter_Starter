// Horizontal Spacing
import 'package:flutter/material.dart';

const Widget horizontalSpaceTiny = SizedBox(width: 5);
const Widget horizontalSpaceSmall = SizedBox(width: 10);
const Widget horizontalSpaceRegular = SizedBox(width: 18);
const Widget horizontalSpaceMedium = SizedBox(width: 25);
const Widget horizontalSpaceLarge = SizedBox(width: 50);

// Vertical Spacing
const Widget verticalSpaceTiny = SizedBox(height: 5);
const Widget verticalSpaceSmall = SizedBox(height: 10);
const Widget verticalSpaceRegular = SizedBox(height: 18);
const Widget verticalSpaceMedium = SizedBox(height: 25);
const Widget verticalSpaceLarge = SizedBox(height: 50);
const Widget verticalSpaceMassive = SizedBox(height: 120);

// Screen Size Helpers
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

/// Returns the pixel amount for the percentage of the screen height.
/// [percentage] should
/// be between 0 and 1 where 0 is 0% and 100 is 100% of the screens height
double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;

/// Returns the pixel amount for the percentage of the screen width.
///  [percentage] should
/// be between 0 and 1 where 0 is 0% and 100 is 100% of the screens width
double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;
