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
}

class DefaultFontPalette implements FontPalette {
  @override
  TextStyle get appbarTitle => GoogleFonts.nunitoSans(fontSize: 25, color: ColorPalette.current.black, fontWeight: FontWeight.bold);

  @override
  TextStyle get cardPrice => GoogleFonts.nunitoSans(fontSize: 14, color: ColorPalette.current.orange, fontWeight: FontWeight.bold);

  @override
  TextStyle get cardTitle =>
      GoogleFonts.nunitoSans(fontSize: 12, color: ColorPalette.current.grey, fontWeight: FontWeight.normal, height: 1);
}
