import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color kBackgroundColor = Color(0xFFFAFAFA);
Color kBlackColor = Color.fromARGB(255, 79, 79, 87);
Color kYellowColor = Color.fromARGB(255, 240, 220, 37);
Color kGreenLightColor = Color.fromARGB(255, 115, 184, 144);
Color kGreenDarkColor = Color(0xFF27AE60);
Color kDarkGreyColor = Color(0xFF979797);
Color kLightGreyColor = Color.fromARGB(255, 184, 183, 194);
Color kWhiteColor = Color.fromARGB(255, 245, 245, 245);
Color kBlueColor = Colors.blue;
Color kButtonBgColor = Colors.white;
Color kButtonTextColor = Colors.black;
Color kFluoroscentGreen = Color.fromARGB(255, 195, 244, 16);

Color kOrangeColor = Color.fromARGB(255, 219, 143, 2);
Color kTextFieldFillColor = kLightGreyColor;

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: kBlackColor,
);

TextStyle lightTextStyle = GoogleFonts.poppins(
  color: kDarkGreyColor,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: Color(0xFFFFFFFF),
);

TextStyle greyTextStyle = GoogleFonts.poppins(
  color: kDarkGreyColor,
);

TextStyle greenTextStyle = GoogleFonts.poppins(
  color: kGreenDarkColor,
);

//double kDefaultMargin = 24.0;
double kDefaultPadding = 10.0;
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight ultraBold = FontWeight.w900;

///STRINGS
const kHomePageHeading = "Where do you want to play?";
const kHomePageSearchHintText = "Find a field...";
const kHomePageFirstRowHeading = "Previous Bookings";
const kHomePageSecondRowHeading = "Neaerest Fields";
