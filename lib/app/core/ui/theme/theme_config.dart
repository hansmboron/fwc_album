import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

class ThemeConfig {
  ThemeConfig._();
  static final OutlineInputBorder _defaulInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(18),
    borderSide: BorderSide(color: ColorsApp.i.greyDark, width: 1),
  );

  static final theme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: TextStyles.i.textPrimaryFontBold.copyWith(
        color: Colors.black,
        fontSize: 18,
      ),
    ),
    primaryColor: ColorsApp.i.primary,
    colorScheme: ColorScheme.fromSeed(
      primary: ColorsApp.i.primary,
      seedColor: ColorsApp.i.primary,
      secondary: ColorsApp.i.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      border: _defaulInputBorder,
      enabledBorder: _defaulInputBorder,
      focusedBorder: _defaulInputBorder,
      contentPadding: const EdgeInsets.all(13),
      labelStyle: TextStyles.i.labelTextField,
    ),
  );
}
