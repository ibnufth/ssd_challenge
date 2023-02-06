import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/util/locator.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'infrastructure/theme/ssd_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyCreator.init();
  var initialRoute = await Routes.initialRoute;
  await initializeDateFormatting('id_ID', null);
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData light = FlexThemeData.light(
      scheme: FlexScheme.blue,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 9,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        blendOnColors: false,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      fontFamily: GoogleFonts.notoSans().fontFamily,
    );
    ThemeData dark = FlexThemeData.dark(
      scheme: FlexScheme.blue,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 15,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      fontFamily: GoogleFonts.notoSans().fontFamily,
    );
    if (Get.isDarkMode) {
      Get.put<SSDTheme>(SSDTheme(dark));
    } else {
      Get.put<SSDTheme>(SSDTheme(light));
    }
    return GetMaterialApp(
      theme: light,
      darkTheme: dark,
      initialRoute: initialRoute,
      getPages: Nav.routes,
    );
  }
}
