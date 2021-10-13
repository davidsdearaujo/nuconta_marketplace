import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_palette.dart';

abstract class FontPalette {
  static void changeCurrent(FontPalette newFontPallete) => _current = newFontPallete;
  static FontPalette? _current;
  static FontPalette get current {
    _current ??= DefaultFontPalette();
    return _current!;
  }

  TextStyle get appbarTitle;
  TextStyle get cardTitle;
  TextStyle get cardPrice;
  TextStyle get detailsTitle;
  TextStyle get detailsDescription;
  TextStyle get buttonText;
  TextStyle get buttonDescription;
}

class DefaultFontPalette implements FontPalette {
  @override
  TextStyle get appbarTitle => GoogleFonts.nunitoSans(fontSize: 25, color: ColorPalette.current.black, fontWeight: FontWeight.w800);

  @override
  TextStyle get buttonDescription => GoogleFonts.nunitoSans(fontSize: 13, color: ColorPalette.current.black, fontWeight: FontWeight.bold);

  @override
  TextStyle get buttonText => GoogleFonts.nunitoSans(fontSize: 14, color: ColorPalette.current.white, fontWeight: FontWeight.bold);

  @override
  TextStyle get cardPrice => GoogleFonts.nunitoSans(fontSize: 14, color: ColorPalette.current.orange, fontWeight: FontWeight.w800);

  @override
  TextStyle get cardTitle =>
      GoogleFonts.nunitoSans(fontSize: 12, color: ColorPalette.current.grey, fontWeight: FontWeight.normal, height: 1);

  @override
  TextStyle get detailsTitle => GoogleFonts.nunitoSans(fontSize: 20, color: ColorPalette.current.black, fontWeight: FontWeight.w800);

  @override
  TextStyle get detailsDescription =>
      GoogleFonts.nunitoSans(fontSize: 17, color: ColorPalette.current.grey, fontWeight: FontWeight.normal, height: 1);
}
