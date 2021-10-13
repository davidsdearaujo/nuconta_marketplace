import 'dart:ui';

abstract class ColorPalette {
  static void changeCurrent(ColorPalette newFontPallete) => _current = newFontPallete;
  static ColorPalette? _current;
  static ColorPalette get current {
    _current ??= DefaultColorPalette();
    return _current!;
  }

  Color get orange;
  Color get purple;
  Color get white;
  Color get black;
  Color get grey;
}

class DefaultColorPalette implements ColorPalette {
  @override
  Color get black => const Color(0xFF1A191C);

  @override
  Color get grey => const Color.fromRGBO(146, 145, 148, 1);

  @override
  Color get orange => const Color(0xFFF68A0A);

  @override
  Color get purple => const Color(0xFFAAA6D6);

  @override
  Color get white => const Color(0xFFF4F5FC);
}
