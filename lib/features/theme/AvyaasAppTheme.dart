import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AvyaasApptheme {
  AvyaasApptheme._();

  static ThemeData light = ThemeData(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      // primarySwatch: Colors.indigo,
      accentColor: Colors.black,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.black,
        textTheme: ButtonTextTheme.primary,
      ),
      scaffoldBackgroundColor: Color(0xfff1f1f1));

  static const Color background = Colors.white;
  static const Color white = Color(0xfffafafa);
  static const Color almostwhite = Color(0xfff2f2f7);
  static const Color black = Color(0xff1b1b1b);
  static const Color almostblack = Color(0xff252525);
  static const Color spashbuttoncolor = black;
  static const Color spashflatbuttoncolor = white;
  static const Color disabledcolor = Color.fromARGB(255, 208, 208, 208);
  static const Color backgroundgraydark = Color(0xffd9d9d9);
  static const Color backgroundgraylight = Color(0xfff1f1f1);
//text
  static const Color textGray = Color(0xff999999);
  static const Color textGrayLight = Color(0xffa5a5a5);
  // static const Color deactivatedText = Color(0xFF767676);
  static const Color textBlack = Color(0xff212529);
  static const Color green = Color(0xff50C878);

  static const String fontName = 'poppins';
  static const String fontNameNumber = 'mont';

//options color
 static const Color option1color = Color(0xff3FB1B5);
  static const Color option2color = Color(0xffE09732);
   static const Color option3color = Color(0xff9A3B82);
    static const Color option4color = Color(0xff8AAF2F);

  static const TextTheme textTheme = TextTheme(
    headline4: display,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText1: body1,
    caption: caption,
  );

  static const TextStyle display = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 58,
    letterSpacing: 0.4,
    height: 1.2,
    color: textBlack,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: textBlack,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 17,
    letterSpacing: 0.18,
    color: textBlack,
  );
 static const TextStyle numbersmall = TextStyle(
    fontFamily: fontNameNumber,
    fontWeight: FontWeight.normal,
    fontSize: 13,
    letterSpacing: 0.18,
    color: textBlack,
  );
  static const TextStyle titleUnbold = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 17,
    letterSpacing: 0.18,
    color: textBlack,
  );
  static const TextStyle subtitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 13,
    letterSpacing: -0.04,
    color: textGray,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: -0.05,
    color: textGrayLight,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 13,
    letterSpacing: 0.2,
    color: textGrayLight, // was lightText
  );
  static getBoxDecoration(Color color, double radius) {
    return BoxDecoration(
        color: color,
        // boxShadow: [
        //   BoxShadow(
        //       color: isShadow ? shadowColor! : Colors.white,
        //       blurRadius: 10.5,
        //       spreadRadius: 2.2,
        //       offset: Offset(5.0, 5.0))
        // ],
        borderRadius: BorderRadius.all(Radius.circular(radius)));
  }

  static getTextTitleWithColor(Color color) => TextStyle(
        fontFamily: fontName,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        letterSpacing: 0.18,
        color: color,
      );
}
