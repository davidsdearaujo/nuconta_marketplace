import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuconta_marketplace/app/modules/design_system/design_system_module.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(
        primaryColor: ColorPalette.current.orange,
        scaffoldBackgroundColor: ColorPalette.current.white,
        cardColor: ColorPalette.current.white,
        colorScheme: ColorScheme.fromSwatch(accentColor: ColorPalette.current.orange),
        textTheme: GoogleFonts.workSansTextTheme(),
      ),
    ).modular();
  }
}
