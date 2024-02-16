
import 'package:chat_app/core/global/theme/ColorManager.dart';
import 'package:chat_app/core/global/theme/FontManager.dart';
import 'package:chat_app/core/global/theme/StylesManager.dart';
import 'package:chat_app/core/global/theme/ValuesManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getApplicationThemData() {
  return ThemeData.dark().copyWith(

      //main colors
      highlightColor: ColorManager.primary.withOpacity(0.1),
      canvasColor: Colors.transparent,
      //primaryIconTheme: IconThemeData(color: ColorManager.grayColor),
      colorScheme: const ColorScheme.dark().copyWith(
          primary: ColorManager.primary, secondary: ColorManager.primary),
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: ColorManager.primary),
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.lightSecondary,
      //cardview theme
      cardTheme: CardTheme(
        color: Colors.white,
        shadowColor: ColorManager.shadowColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
      ),
      //app bar theme
      appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: Colors.white),
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark),
          centerTitle: true,
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle:
              getTitleSemiBoldStyle(color: Colors.white)),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      //button theme
      buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s10),
          ),
          disabledColor: ColorManager.lightSecondary,
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.lightPrimary),
      //elevated button
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20),
        textStyle: getBoldTextStyle(color: Colors.white),
        backgroundColor: ColorManager.primary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
      )),
      //text theme
      textTheme: TextTheme(
        bodySmall: getCardTextStyle(
            color: Colors.white),
        bodyLarge: getRegularTextStyle(
            color: ColorManager.lightTextColor, line: false),
        bodyMedium: getCardTextStyle(
          color: Colors.white,
        ),
        titleSmall: getRegularTextStyle(
            fontSize: FontSize.s14,
            color: Colors.white,
            line: false),
        titleLarge: getTitleBoldStyle(color: Colors.white),
        titleMedium: getTitleSemiBoldStyle(color: Colors.white),
      ),

      //input theme

      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        filled: true,
        fillColor: ColorManager.lightBackGround.withOpacity(0.1),
        contentPadding: const EdgeInsets.all(AppPadding.p18),
        hintStyle: getTitleSemiBoldStyle(
            fontSize: FontSize.s16,
            color: ColorManager.lightBackGround.withOpacity(0.62)),
        labelStyle: getRegularTextStyle(
            fontSize: FontSize.s14,
            color: ColorManager.lightTextColor,
            line: false),
        errorStyle: getTitleSemiBoldStyle(
            fontSize: FontSize.s14, color: ColorManager.cancel),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.lightBackGround, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primary, width: 1.2),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.cancel, width: 1.2),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.cancel, width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10)),
        ),
      ));
}
