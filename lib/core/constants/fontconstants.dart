import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

String poppinsbold='PoppinsBold';
String poppinsregular='PoppinsRegular';
String poppinslight='PoppinsLight';
String poppinssemibold='PoppinsSemiBold';
String poppinsmedium='PoppinsMedium';
String montserratmedium='MontserratMedium';
String freightbold='Freightdispbold';
String freightbook='Freightdispbook';
String freightboldsc='Freightdispboldsc';
String proximanovaregular='Proximanovareg';
String montserratbold='MontserratBold';
String montserratsemibold='MontserratSemiBold';
TextStyle getpoppins(TextStyle textStyle){
  return GoogleFonts.poppins(
    textStyle: textStyle
  );
}
TextStyle getplayfairdisplay(TextStyle textStyle){
  return GoogleFonts.playfairDisplay(
      textStyle: textStyle
  );
}
