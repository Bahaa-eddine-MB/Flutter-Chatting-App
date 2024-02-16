import 'package:chat_app/core/global/theme/FontManager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color color, bool lineThrough) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: FontConstants.fontFamily,
      decoration: lineThrough ? TextDecoration.lineThrough : null);
}

//auth title
TextStyle getTitleBoldStyle(
    {double fontSize = FontSize.s20, required Color color}) {
  return _getTextStyle(fontSize, FontManager.bold, color,false);
}

TextStyle getTitleSemiBoldStyle(
    {double fontSize = FontSize.s20, required Color color}) {
  return _getTextStyle(fontSize, FontManager.medium, color,false);
}

TextStyle getRegularTextStyle(
    {double fontSize = FontSize.s16, required Color color,required bool line}) {
  return _getTextStyle(fontSize, FontManager.regular, color,line);
}

TextStyle getBoldTextStyle(
    {double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(fontSize, FontManager.bold, color,false);
}

TextStyle getSmallTextStyle(
    {double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(fontSize, FontManager.regular, color,false);
}

TextStyle getCardTextStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontManager.regular, color,false);
}
